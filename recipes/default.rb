#
# Cookbook Name:: tomcat7
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


remote_file "/tmp/apache-tomcat-7.0.62.zip" do
  source "http://www.carfab.com/apachesoftware/tomcat/tomcat-7/v7.0.62/bin/apache-tomcat-7.0.62.zip"
end

execute 'unzip' do
  command 'unzip /tmp/apache-tomcat-7.0.62.zip -d /usr/local/'
  not_if 'ls -ld /usr/local/apache-tomcat-7.0.62'
  action :run
end
