node['packages']['install'].each do |pkg|
    package pkg do
        action  :install
        options "--enablerepo=#{node['epel']['repo_name']}" if node['platform_family'] == 'rhel'
    end
end
