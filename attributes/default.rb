default['storm']['version'] = '0.9.1-incubating'
default['storm']['download_url'] =
  'http://apache.mirrors.hoobly.com/storm/apache-storm-0.9.1-incubating/' \
  'apache-storm-0.9.1-incubating.tar.gz'
default['storm']['root_dir'] = '/opt/storm'
default['storm']['log_dir'] = '/var/log/storm'
default['storm']['cluster_role'] = ''

# general storm attributes
default['storm']['yaml']['java.library.path'] = '/usr/local/lib:/opt/local/lib:/usr/lib'
default['storm']['yaml']['storm.local.dir'] = '/mnt/storm'
default['storm']['yaml']['storm.cluster.mode'] = 'distributed'

# worker attributes
default['storm']['yaml']['worker.childopts'] = '-Xmx1280m -XX:+UseConcMarkSweepGC ' \
  '-Dcom.sun.management.jmxremote'
default['storm']['yaml']['worker.heartbeat.frequency.secs'] = 1

default['storm']['yaml']['task.heartbeat.frequency.secs'] = 3
default['storm']['yaml']['task.refresh.poll.secs'] = 10

# ui attributes
default['storm']['yaml']['ui.port'] = 8080
default['storm']['yaml']['ui.childopts'] = '-Xmx768m'

# drpc attributes
default['storm']['yaml']['drpc.port'] = 3772
default['storm']['yaml']['drpc.invocations.port'] = 3773
default['storm']['yaml']['drpc.request.timeout.secs'] = 600

# transactional attributes
default['storm']['yaml']['transactional.zookeeper.root'] = '/storm-transactional'
default['storm']['yaml']['transactional.zookeeper.port'] = 2181

# topology attributes
default['storm']['yaml']['topology.debug'] = false
default['storm']['yaml']['topology.optimize'] = true
default['storm']['yaml']['topology.workers'] = 1
default['storm']['yaml']['topology.acker.executors'] = 1
default['storm']['yaml']['topology.acker.tasks'] = 'null'
default['storm']['yaml']['topology.tasks'] = 'null'
default['storm']['yaml']['topology.message.timeout.secs'] = 30
default['storm']['yaml']['topology.skip.missing.kryo.registrations'] = false
default['storm']['yaml']['topology.max.task.parallelism'] = 'null'
default['storm']['yaml']['topology.max.spout.pending'] = 'null'
default['storm']['yaml']['topology.state.synchronization.timeout.secs'] = 60
default['storm']['yaml']['topology.stats.sample.rate'] = 0.05
default['storm']['yaml']['topology.fall.back.on.java.serialization'] = true
default['storm']['yaml']['topology.worker.childopts'] = 'null'
