#
# Cookbook Name:: apache_storm
# Recipe:: default
#
# Copyright 2014, EverTrue, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

case node['platform_family']
when 'debian'
  include_recipe 'apt'
end

include_recipe 'git'
include_recipe 'java'

# Forcefully update the system-default Java using "alternatives."
# This is--unfortunately--necessary because storm's start script
# cannot be configured to use a specific Java executable.

if platform_family?('debian', 'rhel', 'fedora')
  java_location = "#{node['java']['java_home']}/jre/bin/java"
  execute 'force-update-java-alternatives' do
    command "update-alternatives --set java #{java_location}"
    only_if "update-alternatives --display java | grep '#{java_location} - priority '"
  end
end

include_recipe 'runit'

node.set['storm']['install_dir'] = "#{node['storm']['root_dir']}/apache-storm-#{node['storm']['version']}"

node.set['storm']['lib_dir'] = "#{node['storm']['install_dir']}/lib"
node.set['storm']['conf_dir'] = "#{node['storm']['install_dir']}/conf"
node.set['storm']['bin_dir'] = "#{node['storm']['install_dir']}/bin"

# install dependency packages
%w(unzip python).each do |pkg|
  package pkg do
    action :install
  end
end

# locate the nimbus for this storm cluster
if node.roles.include?(node['storm']['nimbus']['nimbus_search_role'])
  node.set['storm']['yaml']['nimbus.host'] = node[:fqdn]
else
  nimbus_node = search(
    :node,
    node['storm']['nimbus']['node_search_str'] +
    " AND chef_environment:#{node.chef_environment}"
  )
  node.set['storm']['yaml']['nimbus.host'] = nimbus_node.first[:fqdn] if nimbus_node != []
  fail('Nimbus host not found') if nimbus_node.empty?
end

# search for zookeeper servers
zookeeper_quorum = search(
  :node,
  "#{node['storm']['zookeeper']['node_search_str']} AND " \
  "chef_environment:#{node.chef_environment}").map { |n| n[:fqdn] }

fail 'zookeeper_quorum contains no servers.' if zookeeper_quorum.empty?

# setup storm group
group 'storm'

# setup storm user
user 'storm' do
  comment 'Storm user'
  gid 'storm'
  shell '/bin/bash'
  home '/home/storm'
  supports manage_home: true
end

# storm looks for storm.yaml in ~/.storm/storm.yaml so make a link
link '/home/storm/.storm' do
  to node['storm']['conf_dir']
end

# setup directories
%w(
  conf_dir
  log_dir
  install_dir
  bin_dir
).each do |name|
  directory node['storm'][name] do
    owner 'storm'
    group 'storm'
    action :create
    recursive true
  end
end

directory node['storm']['yaml']['storm.local.dir'] do
  owner 'storm'
  group 'storm'
  action :create
  recursive true
end

# download storm
remote_file "#{Chef::Config[:file_cache_path]}/storm-#{node[:storm][:version]}.tar.gz" do
  source node['storm']['download_url']
  owner  'storm'
  group  'storm'
  mode   00644
  action :create_if_missing
end

# uncompress the application tarball into the install directory
execute 'extract_storm' do
  user    'storm'
  group   'storm'
  creates node['storm']['lib_dir']
  cwd     node['storm']['root_dir']
  command "tar xzf #{Chef::Config[:file_cache_path]}/storm-#{node['storm']['version']}.tar.gz"
end

# create a link from the specific version to a generic current folder
link "#{node['storm']['root_dir']}/current" do
  to node['storm']['install_dir']
end

# storm.yaml
template "#{node['storm']['conf_dir']}/storm.yaml" do
  source 'storm.yaml.erb'
  mode 00644
  variables(
    zookeeper_quorum: zookeeper_quorum
  )
end

# sets up storm users profile
template '/home/storm/.profile' do
  owner  'storm'
  group  'storm'
  source 'profile.erb'
  mode   00644
  variables(
    storm_dir: node['storm']['install_dir']
  )
end

template "#{node['storm']['install_dir']}/bin/killstorm" do
  source  'killstorm.erb'
  owner 'root'
  group 'root'
  mode  00755
  variables(log_dir: node['storm']['log_dir'])
end
