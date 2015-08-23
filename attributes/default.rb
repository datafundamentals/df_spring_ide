#deconstructing the download from it's component parts
#http://docs.datafundamentals.com/lib/spring-tool-suite-3.7.0.RELEASE-e4.5-linux-gtk-x86_64.tar.gz
default['df_spring_ide']['version_number'] = "3.7.0"
default['df_spring_ide']['version'] = node['df_spring_ide']['version_number']+ ".RELEASE-e4.5-linux-gtk-x86_64"
default['df_spring_ide']['web_lib_source'] = "http://docs.datafundamentals.com/lib/"
default['df_spring_ide']['name'] = "spring-tool-suite-" + node['df_spring_ide']['version']
default['df_spring_ide']['tar_name'] = node['df_spring_ide']['name'] + ".tar.gz"
default['df_spring_ide']['source'] = node['df_spring_ide']['web_lib_source'] + node['df_spring_ide']['tar_name']  
default['df_spring_ide']['local_dir'] = "/usr/local/spring_ide/"
default['df_spring_ide']['remote_file'] = node['df_spring_ide']['local_dir']  + node['df_spring_ide']['tar_name']   

