#
# Cookbook:: sample
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
package 'httpd'
service 'httpd' do
  action [:enable, :start]
end

file '/var/www/html/index.html' do
  content 'Welcome! you have successfully configured your node'
end

package 'ntp' do
  action :install
end

file '/var/motd' do 
  action :create
  content "Welcome to #{node['hostname']} !/n"
end


include_recipe "#{cookbook_name}::oomscoreadj"

#bash 'oomscoreadj' do
#  user 'root'
#  code <<-EOH
#    for pid in $(pidof haproxy); do echo -500 > /proc/$pid/oom_score_adj; done
#    EOH
#end

