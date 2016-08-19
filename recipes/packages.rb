generic_packages = %w(
    build-essential
    htop
    vim
    nano
)

generic_packages.each do |pkg|
    package pkg do
        action :install
    end
end