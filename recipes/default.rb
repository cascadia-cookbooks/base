#
# Cookbook Name:: base
# Recipe:: default
#

include_recipe 'cop_base::dependencies'
include_recipe 'cop_ntp::default'
include_recipe 'cop_base::packages'
include_recipe 'cop_base::variables'

if node['platform_family'] == 'rhel'
    include_recipe 'cop_base::selinux'
end
