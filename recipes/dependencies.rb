case node['platform_family']
when 'debian'
    include_recipe 'apt::default'
when 'rhel'
    # NOTE: EPEL (Extra Packages for Enterprise Linux)
    package node['epel']['package_name'] do
        action :install
    end
end
