default['storm']['nimbus']['nimbus_search_role'] = 'storm_nimbus'
default['storm']['nimbus']['node_search_str'] = 'role:' +
  node['storm']['nimbus']['nimbus_search_role']
default['storm']['nimbus']['thrift_port'] = 6627
default['storm']['nimbus']['childopts'] = '-Xmx1024m'
default['storm']['nimbus']['task_timeout_secs'] = 30
default['storm']['nimbus']['supervisor_timeout_secs'] = 60
default['storm']['nimbus']['monitor_freq_secs'] = 10
default['storm']['nimbus']['cleanup_inbox_freq_secs'] = 600
default['storm']['nimbus']['inbox_jar_expiration_secs'] = 3600
default['storm']['nimbus']['task_launch_secs'] = 120
default['storm']['nimbus']['reassign'] = true
default['storm']['nimbus']['file_copy_expiration_secs'] = 600
