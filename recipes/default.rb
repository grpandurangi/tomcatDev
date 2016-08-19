#
# Cookbook Name:: ucd_agent
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

#package 'java' do
# action :install
#end 

cookbook_file "/tmp/install_tomcat.sh" do
  source "install_tomcat.sh"
  mode 0755
end

execute "Install Tomcat Server" do
  command "bash /tmp/install_tomcat.sh"
end

cookbook_file "/usr/local/tomcatDev/conf/server.xml" do
 source "server.xml"
end

cookbook_file "/usr/local/tomcatDev/conf/tomcat-users.xml" do
 source "tomcat-users.xml"
end

execute 'Execute my script' do 
  user    'root'
  cwd     '/usr/local/tomcatDev/bin/'
  command '/usr/local/tomcatDev/bin/startup.sh'
end
