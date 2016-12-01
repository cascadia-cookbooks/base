node['environment_vars'].each do |variable, value|
    execute variable do
        command "echo '#{variable}=#{value}' >> /etc/environment"
        only_if "test -e /etc/environment"
    end
end
