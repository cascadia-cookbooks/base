#
# Cookbook Name:: base
# Recipe:: packages
#

packages = node['packages']['install']

unless packages.nil? || packages.empty?
    package packages do
        action  :install
        options "--enablerepo=#{node['epel']['repo_name']}" if node['platform_family'] == 'rhel'
    end
end
