# apache_storm CHANGELOG

## v4.0.1

* Update storm version to 0.9.3 and adjust tests accordingly

## v4.0.0

* Create the Storm YAML config programmatically
    - Much more flexible configuration, but potentially breaking
* Consolidate logging to one directory
    - Utilizes a symlink to do the dirty work. Kludge, but it works.
* Get testing setup working
    - Utilizes multiple test VMs, brought up in sequence and left running to interact
    - Utilizes the `exhibitor` cookbook for a test Zookeeper node, similar to our production efforts
    - Test using Ubuntu 14.04
* Misc. cleanup

## v3.0.0

* Add apt dependency
* Upgrade to the storm 0.9.1 apache package, dropping the use of JZMQ in favor of the built-in queuer
* Add fdlimit attribute to supervisor and nimbus startup
* Move attributes for supervisor, zookeeper, and nimbus to their own files
* Linting cleanup
* Not using vagrant anymore
* Remove platforms we do not test on
* Kill extraneous and-operator

## v2.0.5

* Fix typo in determining Nimbus node exception

## v2.0.4

* Raise exception if Nimbus node isn’t found

## v2.0.3

* Force-update java alternatives
* Revert to using fqdns for zookeeper servers

## v2.0.2

* Use ipaddress for zookeeper servers

## v2.0.0

* Notice (and raise on) empty zookeeper quorum
* Always use self as nimbus server if nimbus role is set locally

## v1.2.6

* Cleaned up food critic warnings
* Made default version 0.8.2

## v1.2.5

* Fixing path in supervisor runit script

## v1.2.4

* Added conf creation to the list of dirs to creat

## v1.2.3

* Changed default ZooKeeper Settings

## v1.2.2

* Removed deploy_build block entirely
* Changed remote_file to use :create_if_missing

## v1.2.1

* Updated run_list to recipe for determing nimbus node

## v1.2.0

* Changes to set node data for topologies to use

## v1.1.0

* Added runit include

## v1.0.34

* Used joshes correct changes

## v1.0.33

* Changed template to be current
* Changed the service reload to not be immediate

## v1.0.31

* Added support for new runit version.

## v1.0.30

* Changed supervisor control script which would prevent a supervisor from
  starting because worker processes were already running. It can happen
  that a supervisor will die but the workers not, then runit will no
  longer be able to start the supervisor. This fix should prevent that.

## v1.0.29

* Changed the default worker memory size.

## v1.0.28

* Add support for Ubuntu to the metadata
* Add a Readme
* Increase file handler limit for nimbus to 20,000

## v1.0.27

* Bump the file handler limit on the webui to 1024. The limit was already increased on Nimbus

## v1.0.26

* Cleans out the state of only the previous runs supervisors, but not the workers.
  Removing the workers state caused supsequent supervisors to bitch about not
  being able to remove the pid files from /mnt/storm/work/XXX/pids without
  end.

## v1.0.25

* Remove the force-yes for installing packages.  This was needed due to the old setup of our apt repo
* Adding default attribute for the storm version

## v1.0.24

* Removed the 'force-stop' call since it is not suported by the 'service' command

## v1.0.23

* Added undeploy scripts.

## v1.0.22

* Address food critic warnings
* Remove the ulimits template since this doesn't work in Ubuntu and was replaced with a ulimit statement in 1.0.21
* Don't fall back to attributes if the Zookeeper node search fails

## v1.0.21

* Add ulimit statement to the runit script for nimbus to increase the file limit to 10240

## v1.0.20

* Add log_dir and install_dir as default attributes

## v1.0.19

* Changed the limits.d file to bump the open file limit for any user

## v1.0.18

* Removed Webtrends specific attributes

## v1.0.17

* Change nimbus and storm ui start/stop scripts to kill related
  processes

## v1.0.16

* Increase file limits for the storm user from 1024 to 32k

## v1.0.15

* Someone changes something

## v1.0.14

* Create a link /opt/storm/current that points to the current version

## v1.0.13

* Some Sean changes

## v1.0.12

* added fallback method of getting zookeeper servers from attributes

## v1.0.10

* storm 0.7.2 as default
* storm pulled from internal repo now, no longer stored as a cookbook file

## v1.0.9

* Force install the prereq packages to resolve issues with unsigned packages
* Add every possible attribute ever, but don't use them *yet*

## v1.0.8

* cookbook re-write
* using debs for zeromq and jzmq
