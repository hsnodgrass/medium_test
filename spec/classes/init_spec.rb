require 'spec_helper'
require 'puppetlabs_spec_helper/puppetlabs_spec_helper'
require 'puppetlabs_spec_helper/puppetlabs_spec/puppet_internals'

describe 'medium_test' do
  before :each do
    Puppet.initialize_settings
    Puppet::Type.type(:exec).provide :powershell, :parent => Puppet::Provider::Exec do
      def validatecmd(cmd)
      end
      def run(command, check = false)
      end
    end
    Puppet::Type.newtype(:registry_value) do
      def self.title_patterns
        [[/^(.*?)\Z/m, [[:path, lambda { |x| x }]]]]
      end
      ensurable
      newparam(:path, :namevar => true) do
      end
      newproperty(:type) do
      end
      newproperty(:data, :array_matching => :all) do
      end
    end
    Puppet::Type.type(:package).provide :chocolatey, :parent => Puppet::Provider::Package do
      def install
      end
      def uninstall
      end
      def update
      end
      def query
      end
      def latestcmd
      end
      def latest
      end
    end
  end

  let(:spec) { Puppetlabsspec:PuppetInternals }

  let!(:get_supercool) { MockFunction.new('get_supercool') { |f|
    f.stubbed.with('https://our.supercool.webservice/api/', 'our_api_token', "Vengevine").returns('{"data": {"value": "TestValue"}}')
  } }

  let(:title) { 'medium_test' }

  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      it { is_expected.to compile }
    end
  end
end
