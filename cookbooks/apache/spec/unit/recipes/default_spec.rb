#
# Cookbook Name:: apache
# Spec:: default
#
# Copyright (c) 2021 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::default' do
  context 'when run on centos' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.8.2003')
      runner.converge(described_recipe)
    end

    it 'installs the correct package' do
      expect(chef_run).to install_package('httpd')
    end

    it 'creates a default html file' do
      expect(chef_run).to create_template('/var/www/html/index.html')
    end

    it 'starts the service' do
      expect(chef_run).to start_service('httpd')
    end

    it 'enables the service' do
      expect(chef_run).to enable_service('httpd')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end

describe 'apache::default' do
  context 'when run on ubuntu' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'installs the correct package' do
      expect(chef_run).to install_package('apache2')
    end

    it 'creates a default html file' do
      expect(chef_run).to create_template('/var/www/html/index.html')
    end

    it 'starts the service' do
      expect(chef_run).to start_service('apache2')
    end

    it 'enables the service' do
      expect(chef_run).to enable_service('apache2')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end

