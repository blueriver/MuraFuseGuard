MuraFuseGuard
======================

The FuseGuard Web Application Firewall for ColdFusion is a set of code designed to run inside your existing CFML web applications to block, filter, or log potentially malicious requests.

Installation is as simple as copying a folders, optionally creating a database (see the install.txt file for details), and installing the MuraFuseGuard plugin. Configuration, and all of the actual filtering, is done with ColdFusion so you don't need to learn a new XML language or complicated user interfaces. The Foundeo WAF (Web Application Firewall) is designed for easy implementation and extension (you can write your own filters / loggers as CFCs).

REQUIRES:
Adobe ColdFusion 9 or 10
Railo 3 and up
Mura Core Version 6.0.5345 and up

This plugin connects a Mura to an existing FuseGuard instance. So you must first configure FuseGuard before using this plugin. To do this:

1. You must [purchase FuseGuard](https://foundeo.com/security/), or [download an evaluation copy](https://foundeo.com/security/eval/)
2. Place the `/fuseguard/` folder in your web root.
3. Optionally create a database and datasource for FuseGuard to log to, it does not need to use the same datasource as mura. See the `/sql/` folder in the FuseGuard zip file for creation scripts.
4. Configure FuseGuard by creating a Configurator cfc in the `/fuseguard/components/configurators/` folder. You may simply copy the `DefaultConfigurator.cfc` and call it `MyConfigurator.cfc`. Be sure to specify the database type and datasource name in the configurator file.     
5. Download this repository as a zip and install it as a plugin in Mura (Site Manager / Modules / Plugins / Add Plugin). 


For more details please visit the following URL: 

[http://foundeo.com/security/](http://foundeo.com/security/)


