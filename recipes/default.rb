#
# Cookbook Name:: stig-iis
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

windows_feature 'IIS-WebserverRole' do
	all true
end

#windows_feature 'IIS-Webserver'

windows_feature 'IIS-ASPNET45' do
	all true
end

file 'C:\inetpub\wwwroot\iisstart.htm' do
	content '<h1> Hello Chris!</h1>'
    notifies :restart, "service[w3svc]"
end
	
service 'w3svc' do
	action [ :enable, :start ]
end
		