file '/etc/environment' do
    owner  'root'
    group  'root'
    mode   0644
    action :create_if_missing
end

unless node['environment_vars'].nil? || node['environment_vars'].empty?
    node['environment_vars'].each do |variable, value|
        execute variable do
            command "echo '#{variable}=#{value}' >> /etc/environment"
            # NOTE: this grep might be aggresive
            not_if  "grep #{variable} /etc/environment"
        end
    end
end
