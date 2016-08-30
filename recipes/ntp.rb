package 'ntp' do
  action :install
end

cookbook_file '/etc/ntp.conf' do
  source   'ntp.conf'
  owner    'root'
  group    'root'
  mode     0644
  action   :create
  notifies :restart, 'service[ntp]', :immediately
end

service "ntp" do
  action :enable
end
