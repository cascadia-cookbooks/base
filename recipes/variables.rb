file '/etc/environment' do
    action :touch
end

node['environment_vars'].each do |variable, value|
    execute variable do
        command "echo '#{variable}=#{value}' >> /etc/environment"
    end
end
