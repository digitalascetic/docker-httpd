# docker-httpd


*Based on httpd-{version}-alpine images*

### Customization

httpd-2.4.46-alpine image with user and group changed to **www-data**. 

Also created _**/var/www/vhosts/**_ empty directory to simplify virtual hosts management.

##### Loaded Modules

_By default:_
* mod_mpm_event.so
* mod_authn_file.so
* mod_authn_core.so
* mod_authz_host.so
* mod_authz_groupfile.so
* mod_authz_user.so
* mod_authz_core.so
* mod_access_compat.so
* mod_auth_basic.so
* mod_reqtimeout.so
* mod_filter.so
* mod_mime.so
* mod_log_config.so
* mod_env.so
* mod_headers.so
* mod_setenvif.so
* mod_version.so
* mod_unixd.so
* mod_status.so
* mod_autoindex.so
* mod_dir.so
* mod_alias.so

_Custom loaded:_

* mod_ssl.so
* mod_socache_shmcb.so
* mod_rewrite.so
* mod_proxy.so
* mod_proxy_fcgi.so


### Build
```
# You can change the APACHE_VERSION argument
docker build --build-arg APACHE_VERSION=.4.46 -t ascetic/httpd .
```

### RUN
```
docker run -i -d --name apache -p 8080:80 --network {SAME_NETWORK_AS_PHP_NODE}  -t ascetic/httpd
```