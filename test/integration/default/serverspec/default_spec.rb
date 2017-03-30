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

describe 'base::selinux' do
    case os[:family]
    when 'ubuntu', 'debian'
         describe file('/etc/selinux/config') do
             it { should_not exist }
         end

         describe package('setools-console') do
             it { should_not be_installed }
         end

         describe command('sestatus') do
             its(:exit_status) { should_not eq 0 }
         end
    when 'redhat'
        describe file('/etc/selinux/config') do
            it { should contain "SELINUX=permissive" }
        end

        describe file('/etc/selinux/config') do
            it { should contain "SELINUXTYPE=targeted" }
        end

         describe package('setools-console') do
             it { should be_installed }
         end

        describe command('sestatus') do
            its(:exit_status) { should eq 0 }
            its(:stdout) { should contain "^Current mode.*permissive$" }
        end
    end
end
