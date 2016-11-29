case node['platform']
when 'centos'
    include_recipe 'cop_base::yum'
end

generic_packages = node.default['packages']

generic_packages.each do |pkg|
    package pkg do
        action :install
        options '--enablerepo=epel' if node['platform'] == 'centos'
    end
end
