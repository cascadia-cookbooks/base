default['packages'] = %w(
    htop
    vim
    nano
)

case node['platform_family']
when 'debian'
    default['packages'] += %w(autoconf binutils-doc bison build-essential flex gettext ncurses-dev)
when 'fedora', 'rhel'
    default['packages'] += %w(autoconf bison flex gcc gcc-c++ gettext kernel-devel make m4 ncurses-devel patch)
    default['packages'] += %w(gcc44 gcc44-c++) if node['platform_version'].to_i < 6
end
