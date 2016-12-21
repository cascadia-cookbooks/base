default['packages']['install'] = %w(
    htop
    vim
    nano
    git
)

case node['platform_family']
when 'debian'
    default['packages']['install'] += %w(autoconf binutils-doc bison build-essential flex gettext ncurses-dev)
when 'fedora', 'rhel'
    default['epel']['package_name'] = 'epel-release'
    default['epel']['repo_name']    = 'epel'

    default['packages']['install'] += %w(autoconf bison flex gcc gcc-c++ gettext kernel-devel make m4 ncurses-devel patch)
    default['packages']['install'] += %w(gcc44 gcc44-c++) if node['platform_version'].to_i < 6
end
