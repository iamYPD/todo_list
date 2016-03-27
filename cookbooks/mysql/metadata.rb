name 'mysql'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@getchef.com'
license 'Apache 2.0'
descriptioin 'Provides mysql_service and mysql_client resources'

version '5.5.3'

supports 'amazon'
supports 'redhat'
supports 'centos'
supports 'scientific'
supports 'fedora'
supports 'debian'
supports 'ubuntu'
supports 'smartos'
supports 'omnios'
supports 'freebsd'
supports 'suse'

depends 'yum-mysql-community'
