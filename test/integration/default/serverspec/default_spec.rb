require 'spec_helper'

describe 'base::default' do
  describe package('ntp') do
    it { should be_installed }
  end

  describe package('git') do
    it { should be_installed }
  end

  describe package('htop') do
    it { should be_installed }
  end

  describe file('/etc/environment') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode '644' }
    it { should contain 'testing=true' }
  end
end
