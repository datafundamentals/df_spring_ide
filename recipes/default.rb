#
# Cookbook Name:: df_eclipse_ee _ee
# Recipe:: default
#
# Copyright (c) 2015 Pete Carapetyan, All Rights Reserved.


log "\n\nINITIATING SPRINGIDE RUN FROM DOWNLOAD #{node['df_spring_ide']['source']}\n\n" do 
    level :info
end

template '/home/vagrant/README_SPRING_IDE.txt' do 
  source 'README_SPRING_IDE.txt.erb'
  mode "0644"
  user 'vagrant'
  group 'vagrant'
  only_if { ::File.exists?('/home/vagrant') }
end

template '/home/vagrant/chef_spring_ide_attribute_values.txt' do 
  source 'attribute_values.txt.erb'
  mode "0644"
  user 'vagrant'
  group 'vagrant'
  only_if { ::File.exists?('/home/vagrant') }
end

template '/home/vagrant/startSpringIDE.sh' do 
  source 'startSpringIDE.sh.erb'
  mode "0777"
  user 'vagrant'
  group 'vagrant'
  only_if { ::File.exists?('/home/vagrant') }
end

directory node['df_spring_ide']['local_dir'] do 
  mode "0755"
  recursive true
  user 'vagrant'
  group 'vagrant'
  action :create 
end



remote_file node['df_spring_ide']['remote_file'] do 
    source node['df_spring_ide']['source']
    mode "0755" 
    action :create_if_missing
end

execute "unzip_file" do 
    cwd node['df_spring_ide']['local_dir']
    command "tar -xzvf " + node['df_spring_ide']['tar_name']
    action :run
end