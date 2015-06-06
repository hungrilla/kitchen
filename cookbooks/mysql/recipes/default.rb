mysql_client 'default' do
  version node['mysql']['version']
  action [:create]
end

mysql_service 'default' do
  version node['mysql']['version']
  instance 'default'
  bind_address '0.0.0.0'
  port '3306'
  socket node['mysql']['socket']
  data_dir node['mysql']['data_dir']
  initial_root_password node['mysql']['initial_root_password']
  action [:create, :start]
end