default['storm']['supervisor']['workers'] = 4

default['storm']['yaml']['supervisor.childopts'] = '-Xmx1024m'
default['storm']['yaml']['supervisor.worker.start.timeout.secs'] = 120
default['storm']['yaml']['supervisor.worker.timeout.secs'] = 30
default['storm']['yaml']['supervisor.monitor.frequency.secs'] = 3
default['storm']['yaml']['supervisor.heartbeat.frequency.secs'] = 5
default['storm']['yaml']['supervisor.enable'] = true

default['storm']['supervisor']['fdlimit'] = 65_535
