#
# Cookbook Name:: base
# Recipe:: default
#

include_recipe 'cop_base::dependencies'
include_recipe 'cop_base::ntp'
include_recipe 'cop_base::packages'
