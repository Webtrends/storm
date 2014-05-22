default['storm']['version'] = '0.9.1-incubating'
default['storm']['download_url'] =
  'http://mirror.cogentco.com/pub/apache/incubator/storm/' \
  'apache-storm-0.9.1-incubating/apache-storm-0.9.1-incubating.tar.gz'
default['storm']['checksum'] = '5f665dc0aea531ae5e899354eaafefe85c6b88d14677' \
  '569be34822c03a86806e'
default['storm']['root_dir'] = '/opt/storm'
default['storm']['log_dir'] = '/var/log/storm'
default['storm']['cluster_role'] = ''

# general storm attributes
default['storm']['java_lib_path'] = '/usr/local/lib:/opt/local/lib:/usr/lib'
default['storm']['local_dir'] = '/mnt/storm'
default['storm']['local_mode_zmq'] = 'false'
default['storm']['cluster_mode'] = 'distributed'

# worker attributes
default['storm']['worker']['childopts'] = '-Xmx1280m -XX:+UseConcMarkSweepGC ' \
  '-Dcom.sun.management.jmxremote'
default['storm']['worker']['heartbeat_frequency_secs'] = 1
default['storm']['task']['heartbeat_frequency_secs'] = 3
default['storm']['task']['refresh_poll_secs'] = 10

# ui attributes
default['storm']['ui']['port'] = 8080
default['storm']['ui']['childopts'] = '-Xmx768m'

# drpc attributes
default['storm']['drpc']['port'] = 3772
default['storm']['drpc']['invocations_port'] = 3773
default['storm']['drpc']['request_timeout_secs'] = 600

# transactional attributes
default['storm']['transactional']['zookeeper']['root'] = '/storm-transactional'
default['storm']['transactional']['zookeeper']['port'] = 2181

# topology attributes
default['storm']['topology']['debug'] = false
default['storm']['topology']['optimize'] = true
default['storm']['topology']['workers'] = 1
default['storm']['topology']['acker_executors'] = 1
default['storm']['topology']['acker_tasks'] = 'null'
default['storm']['topology']['tasks'] = 'null'
default['storm']['topology']['message_timeout_secs'] = 30
default['storm']['topology']['skip_missing_kryo_registrations'] = false
default['storm']['topology']['max_task_parallelism'] = 'null'
default['storm']['topology']['max_spout_pending'] = 'null'
default['storm']['topology']['state_synchronization_timeout_secs'] = 60
default['storm']['topology']['stats_sample_rate'] = 0.05
default['storm']['topology']['fall_back_on_java_serialization'] = true
default['storm']['topology']['worker_childopts'] = 'null'
