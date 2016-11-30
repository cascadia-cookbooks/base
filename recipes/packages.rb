node['packages']['install'].each do |pkg|
    package pkg do
        action :install
        options '--enablerepo=epel' if node['platform_family'] == 'rhel'
    end
end
