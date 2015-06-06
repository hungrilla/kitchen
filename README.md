# Kitchen.
Vagrant Box for Development Environment.

### Wait, wtf is this again?

This is a [vagrant](http://vagrantup.com) box for a complete webdevelopment workspace. It includes `nginx`, `nodejs`, `mysql`, `vim`, `git` and `build-essentials`. Along with these cookbooks, it installs several `npm` packages globally such as `grunt-cli`, `nodemon`, `bower` etc. Everything that is necessary to set up virtual environment to run hungrilla api.

### Cool, so how does it work?

- Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
- Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
- Clone this repository: `git clone https://github.com/hungrilla/kitchen.git` in the same directory where `garcon` & `potato` are cloned. (If they are somewhere else, you may need to change paths in `Vagrantfile`)
- Move into the clone repository.
- Write `vagrant up`. And tada~ (P.S. It may take while for the first time.)

### Hey, mysql command line doesn't work?

If you log into the machine and type `mysql`, you may see an error
like this one:

`Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock'`

This is because MySQL is hardcoded to read the defined default my.cnf
file, typically at /etc/my.cnf, and this LWRP deletes it to prevent
overlap among multiple MySQL configurations. 

To connect to the socket from the command line, check the socket in the relevant my.cnf file and use something like this:

`mysql -S /var/run/mysql-default/mysqld.sock -Pwhatever`

Or to connect over the network, use something like this:
connect over the network..

`mysql -h 127.0.0.1 -Pwhatever`

For more information: [Link](https://github.com/chef-cookbooks/mysql/)

### Something is broke, what should I do?

Create an issue or be a gentleman and send a PR. If you're not willing to do either of those then suck it up.
