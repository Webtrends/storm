default['storm']['nimbus']['nimbus_search_role'] = 'storm_nimbus'
default['storm']['nimbus']['node_search_str'] =
  "role:#{node['storm']['nimbus']['nimbus_search_role']}"

default['storm']['yaml']['nimbus.thrift.port'] = 6627
default['storm']['yaml']['nimbus.childopts'] = '-Xmx1024m'
default['storm']['yaml']['nimbus.task.timeout.secs'] = 30
default['storm']['yaml']['nimbus.supervisor.timeout.secs'] = 60
default['storm']['yaml']['nimbus.monitor.freq.secs'] = 10
default['storm']['yaml']['nimbus.cleanup.inbox.freq.secs'] = 600
default['storm']['yaml']['nimbus.inbox.jar.expiration.secs'] = 3600
default['storm']['yaml']['nimbus.task.launch.secs'] = 120
default['storm']['yaml']['nimbus.reassign'] = true
default['storm']['yaml']['nimbus.file.copy.expiration.secs'] = 600

default['storm']['nimbus']['fdlimit'] = 65_535
