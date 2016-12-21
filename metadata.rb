name                'cop_base'
maintainer          'Copious, Inc.'
maintainer_email    'engineering@copiousinc.com'
license             'MIT'
description         'Base OS packages.'
long_description    IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version             '0.0.11'
source_url          'https://github.com/copious-cookbooks/base'
issues_url          'https://github.com/copious-cookbooks/base/issues'

depends 'apt'
depends 'cop_ntp'

supports 'ubuntu', '>= 12.04'
supports 'debian', '>= 7'
supports 'rhel'
supports 'centos', '>= 6'
