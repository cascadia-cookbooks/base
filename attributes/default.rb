case node['platform_family']
when 'debian'
    default['packages']['install'] = %w(
        autoconf
        binutils-doc
        bison
        build-essential
        flex
        gettext
        git
        htop
        nano
        ncurses-dev
        vim
    )
when 'rhel'
    default['packages']['install'] = %w(
        autoconf
        bison
        flex
        gcc
        gcc-c++
        gettext
        git
        htop
        kernel-devel
        m4
        make
        nano
        ncurses-devel
        patch
        vim-enhanced
    )

    default['packages']['install'] += %w(gcc44 gcc44-c++) if node['platform_version'].to_i < 6

    default['epel']['package_name'] = 'epel-release'
    default['epel']['repo_name']    = 'epel'

    default['selinux']['mode']                     = 'permissive'
    default['selinux']['type']                     = 'targeted'
    default['selinux']['dev_packages']['enabled']  = false
    default['selinux']['dev_packages']['packages'] = %w(
        policycoreutils-python
        setools-console
        setroubleshoot
        setroubleshoot-server
    )
end
