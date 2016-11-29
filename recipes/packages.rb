generic_packages = node.default['packages']

generic_packages.each do |pkg|
    package pkg do
        action :install
        options '--enablerepo=epel' if node['platform_family'] == 'rhel'
    end
end
