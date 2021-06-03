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
  # notifies :restart, 'service[httpd]', :immediately
end

service 'httpd' do
  action [ :enable, :start ]
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end

#directory '/var/www/mysites' do
#  owner 'apache'
#  recursive true
#end

#cookbook_file '/var/www/html/index.html' do
#  source 'index.html'
#  action :create
#end

#execute 'run a script' do
#  user 'root'
#  command <<-EOH
#mkdir -p /var/www/mysites \
#chown -R apache /var/www/mysites
#EOH
#end

#bash 'inline script' do
#  user 'root'
#  code 'mkdir -p /var/www/mysites && chown -R apache /var/www/mysites'
#  not_if '[ -d /var/www/mysites ]'
#  not_if do
#    File.directory?('var/www/mysites')
#  end
#end

#execute 'run a command' do
#  user 'root'
#  command './myscript.sh'
#end
