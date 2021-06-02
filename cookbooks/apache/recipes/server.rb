#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2021 The Authors, All Rights Reserved.
package 'httpd' do
  action :install
end

template '/var/www/html/index.html' do
  action :create
  source 'index.html.erb'
  variables(
    :name => 'rsmith'
  )
end

#cookbook_file '/var/www/html/index.html' do
#  source 'index.html'
#  action :create
#end

service 'httpd' do
  action [ :enable, :start ]
end
