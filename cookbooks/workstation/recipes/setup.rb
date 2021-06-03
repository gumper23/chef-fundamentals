package 'tree' do
  action :install
end

package 'ntp' do
  action :install
end

package 'vim-enhanced' do
  action :install
end

package 'nano' do
  action :install
end

package 'git' do
  action :install
end

package 'emacs' do
  action :install
end

package 'zsh' do
  action :install
end

package 'epel-release' do
  action :install
end

package 'jq' do
  action :install
end

template '/etc/motd' do
  action :create
  source 'motd.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(
    :name => 'rsmith'
  )
end

service 'ntpd' do
  action [ :enable, :start ]
end

user 'user1' do
  action :remove
end

group 'admins' do
  action :remove
end
