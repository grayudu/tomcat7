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

%w{host-manager manager examples docs}.each do |dir|
  directory "/usr/local/apache-tomcat-7.0.62/webapps/#{dir}" do
    action :delete
    recursive true
  end
end

cookbook_file "/usr/local/apache-tomcat-7.0.62/webapps/ROOT/index.jsp" do
  source "index.html"
  owner "appadmin"
  group "app"
  mode "0664"
end

cookbook_file "/usr/local/apache-tomcat-7.0.62/webapps/ROOT/ctodevlogo_trans.png" do
  source "ctodevlogo_trans.png"
  owner "appadmin"
  group "app"
  mode "0664"
end

cookbook_file "/usr/local/apache-tomcat-7.0.62/webapps/ROOT/favicon.ico" do
  source "favicon.ico"
  owner "appadmin"
  group "app"
  mode "0664"
end


execute "Tomcat Start" do
  command 'sh /usr/local/apache-tomcat-7.0.62/bin/catalina.sh start'
  not_if 'ps -ef|grep tomcat|grep -v grep'
  action :run
end

