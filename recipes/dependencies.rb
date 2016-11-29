case node['platform_family']
when 'debian'
    include_recipe 'apt::default'
when 'rhel'
    include_recipe 'cop_base::yum'
end
