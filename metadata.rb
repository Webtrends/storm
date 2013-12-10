name             'apache_storm'
maintainer       'EverTrue, Inc.'
maintainer_email 'devops@evertrue.com'
license          "All rights reserved"
description      "Installs Twitter's Storm distributed computation system"
version          "2.0.5"

depends          "git"
depends          "java"
depends          "runit"
depends          "et_jzmq", '= 1.0.1'

supports         "ubuntu"
