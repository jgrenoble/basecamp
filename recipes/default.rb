#
# Cookbook Name:: basecamp
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'httpd' do
	action :remove
end

package 'sendmail' do
	action :remove
end

package 'crontabs' do
  action :install
end

service 'crond' do
  action :start
end

cron 'chef-client-job' do
  minute '0,30'
  command %w{chef-client >> /var/log/chef-client.log}.join(' ')
end