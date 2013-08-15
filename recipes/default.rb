#
# Cookbook Name:: storm
# Recipe:: default
#
# Copyright 2012, Webtrends, Inc.
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

# include recipes we depend on
%w(ark java runit).each { |recipe| include_recipe recipe }

# install dependency packages
%w{unzip python}.each { |pkg| package(pkg) { action :install } }

install_dir = "#{node['storm']['root_dir']}/storm-#{node['storm']['version']}"

node.set['storm']['lib_dir'] = "#{install_dir}/lib"
node.set['storm']['conf_dir'] = "#{install_dir}/conf"
node.set['storm']['bin_dir'] = "#{install_dir}/bin"
node.set['storm']['install_dir'] = install_dir


#locate the nimbus for this storm cluster
nimbus_host = Array.new
if node.recipes.include?('storm::nimbus')
  nimbus_host = node
else
  begin
    nimbus_host = search(:node, "role:storm_nimbus AND role:#{node['storm']['cluster_role']} AND chef_environment:#{node.chef_environment}").first
  rescue Exception => e
    # search doesn't work in OpsWorks or Chef Solo
    Chef::Log.info("problem with search: #{e.message} using value found in node: #{node[:storm][:nimbus][:host]}")
    nimbus_host = node[:storm][:nimbus][:host]
  end
end

# search for zookeeper servers
zookeeper_quorum = Array.new
begin
  search(:node, "role:zookeeper AND chef_environment:#{node.chef_environment}").each do |n|
    zookeeper_quorum << n[:fqdn]
  end
rescue Exception => e
  # search doesn't work in OpsWorks or Chef Solo
  Chef::Log.info("problem finding zookeeper via search: \"#{e.message}\" using value found in node: #{node[:storm][:zookeeper][:quorum]}")
  zookeeper_quorum = node[:storm][:zookeeper][:quorum]
end

# setup storm group
group "storm"

# setup storm user
user "storm" do
  comment "Storm user"
  gid "storm"
  shell "/bin/bash"
  home "/home/storm"
  supports :manage_home => true
end

ark 'storm' do
  action :install
  owner 'storm'
  group 'storm'
  mode   00755
  append_env_path true

  url         "#{node['storm']['download_url']}/storm-#{node['storm']['version']}.zip"
  version     node['storm']['version']
  path        node['storm']['root_dir']
  prefix_root node['storm']['root_dir']
  home_dir    "#{node['storm']['root_dir']}/current"
end

# storm looks for storm.yaml in ~/.storm/storm.yaml so make a link
link "/home/storm/.storm" do
  to node['storm']['conf_dir']
end

# setup directories
%w{conf_dir local_dir log_dir install_dir bin_dir}.each do |name|
  directory node['storm'][name] do
    owner "storm"
    group "storm"
    action :create
    recursive true
  end
end

# storm.yaml
template "#{node['storm']['conf_dir']}/storm.yaml" do
  source "storm.yaml.erb"
  mode 00644
  variables(
    :nimbus => nimbus_host,
    :zookeeper_quorum => zookeeper_quorum
  )
end

template "#{node['storm']['install_dir']}/bin/killstorm" do
  source  "killstorm.erb"
  owner "root"
  group "root"
  mode  00755
  variables({
    :log_dir => node['storm']['log_dir']
  })
end