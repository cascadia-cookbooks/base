#
# Cookbook Name:: base
# Recipe:: default
#

include_recipe 'build-essential'
include_recipe 'cop_base::apt'
include_recipe 'cop_ntp::default'
include_recipe 'cop_base::packages'
