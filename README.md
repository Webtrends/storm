Description
===========
Installs Twitter's Storm distributed computation platform.  Includes recipes for installing
both the Nimbus / Web UI component and the Supervisor component.

Requirements
============
* Ubuntu 10.04 / 12.04
* May function on other distributions, but has not been tested

* java cookbook
* runit cookbook

Attributes
==========

Usage
=====

This recipe relies on two setup components that need to be noted as they are not used
in many (or any) community cookbooks.

Role Based Cluster Setup:
This cookbook relies on a cluster identification role to allow more than one storm cluster
to run in a single Chef environment, while not breaking Chef search.  Create a role with
a name of your choosing.  The role may be left empty or you may use it to apply the your
application's topology and all necessary JARs within your topology.  You will need to
specify the name of this role using the node attribute ['storm']['cluster_role'], which
is empty by default.  You will need to apply this cluster role to both supervisor and
the nimbus/UI node in your cluster
