name              'storm'
maintainer        'Webtrends, Inc.'
maintainer_email  'kendrick.martin@webtrends.com'
license           'All rights reserved'
description       'Installs Twitter\'s Storm distributed computation system'
version           '1.2.5'

%w(ark java runit).each { |dep| depends dep }

supports 'ubuntu'
