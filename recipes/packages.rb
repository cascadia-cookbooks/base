generic_packages = node.default['packages']

generic_packages.each do |pkg|
    package pkg do
        action :install
    end
end