#
# Cookbook Name:: base
# Recipe:: selinux
#

selinux         = node[:selinux]
dev_packages    = selinux[:dev_packages]

if dev_packages[:enabled]
    dev_pacakages[:packages].each do |p|
        package p do
            action :install
        end
    end
end

# Set SELinux config on boot
file '/etc/selinux/config' do
    content "SELINUX=permissive\nSELINUXTYPE=targeted"
end

# Set SELinux mode in session
execute 'Setting SELinux mode to permissive' do
    command 'setenforce 0'
    not_if  'sestatus | grep "^Current mode.*permissive$"'
end
