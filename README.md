[![Build Status](https://travis-ci.org/evertrue/apache_storm.svg?branch=master)](https://travis-ci.org/evertrue/apache_storm)

Description
===========
Installs Twitter's Storm distributed computation platform.  Includes recipes for installing
both the Nimbus / Web UI component and the Supervisor component.

Requirements
============
* Ubuntu 12.04
* May function on other distributions, but has not been tested

### External Cookbook Dependencies:
* java cookbook
* runit cookbook
* apt cookbook
* git cookbook

Attributes
==========

A lot.  Anything that can be specified in Storm's YAML file can be specified as an attribute by using:

`storm['yaml'][CONFIGURATION_KEY]` = "VALUE"

Strings are automatically rendered with quotes around them (except "null" which is rendered
without quotes).  Integers are printed as-is.

### Other important attributes not used in the YAML file:

#### Attributes you need to care about
* `storm['cluster_role']` - The role that defines a storm cluster.  This is used by nodes in the 
cluster to find other nodes in the cluster.  You can set this to anything you want but it needs to be the
same for all nodes in the cluster.
* `storm['zookeeper']['node_search_str']` - The string used (with `search()`) to find the nodes of your
zookeeper cluster, if you're using [Apache Zookeeper](http://zookeeper.apache.org/).  The cookbook will
automatically append "AND chef_environment:#{node.chef_environment}" so that only nodes in the same
environment will be included.

#### Attributes you probably won't care about
* `storm['version']` - Which storm version to install
* `storm['download_url']` - The full download URL from which to grab the tarball
* `storm['checksum']` - Checksum of the tarball
* `storm['root_dir']` - Base directory of the storm install
* `storm['log_dir']` - Log directory

Usage
=====

At a basic level the only thing you should need to do to get this working is add both the nimbus
and supervisor roles to your nodes' run lists and set the needed attributes above.
