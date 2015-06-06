# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "opscode-ubuntu-12.04_chef-11.4.0"
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.4.0.box"

  config.ssh.forward_agent = true


  config.vm.synced_folder '../garcon', '/var/www/api', owner: 'root', group: 'root'
  config.vm.synced_folder '../potato', '/var/www/scrapper', owner: 'root', group: 'root'
  
  config.vm.hostname = "#{`hostname`[0..-2]}-web"

  config.vm.network :private_network, ip: '192.168.11.1'

  config.vm.network :forwarded_port, guest: 80, host: 2000

  config.vm.network :forwarded_port, guest: 3306, host: 3307

  
  #config.vm.forward_port 80, 2000 # nginx
  #config.vm.forward_port 3306, 3306 # mysql
  
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe :apt
    chef.add_recipe 'vim'
    chef.add_recipe 'nginx'
    chef.add_recipe 'git'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'mysql'
    chef.json = {
      :nodejs => {
        :version            => '0.12.2',
        :install_method     => 'binary',
        :npm_packages       => [
          {
            :name           => 'grunt-cli'
          },
          {
            :name           => 'bower'
          },
          {
            :name           => 'nodemon'
          },
          {
            :name           => 'jscs'
          }
        ]
      },
      :nginx => {
        :dir                => "/etc/nginx",
        :log_dir            => "/var/log/nginx",
        :binary             => "/usr/sbin/nginx",
        :user               => "www-data",
        :init_style         => "runit",
        :pid                => "/var/run/nginx.pid",
        :worker_connections => "1024"
      },
      :git   => {
        :prefix => "/usr/local"
      },
      :mysql => {
        :initial_root_password   => "password",
        :server_repl_password   => "password",
        :server_debian_password => "password",
        :service_name           => "mysql",
        :basedir                => "/usr",
        :data_dir               => "/var/lib/mysql",
        :root_group             => "root",
        :mysqladmin_bin         => "/usr/bin/mysqladmin",
        :mysql_bin              => "/usr/bin/mysql",
        :conf_dir               => "/etc/mysql-default",
        :confd_dir              => "/etc/mysql-default/conf.d",
        :socket                 => "/var/run/mysql-default/mysqld.sock",
        :pid_file               => "/var/run/mysql-default/mysqld.pid",
        :grants_path            => "/etc/mysql-default/grants.sql"
      }
    }
  end
end
