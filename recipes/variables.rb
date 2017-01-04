file '/etc/environment' do
    action :touch
end

unless node['environment_vars'].nil? || node['environment_vars'].empty?
    node['environment_vars'].each do |variable, value|
        execute variable do
            command "echo '#{variable}=#{value}' >> /etc/environment"
        end
    end
end
