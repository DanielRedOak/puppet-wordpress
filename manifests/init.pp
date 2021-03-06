# == Class: wordpress
#
# This module manages wordpress
#
# === Parameters
#
# [*install_dir*]
#   Specifies the directory into which wordpress should be installed. Default:
#   /opt/wordpress
#
# [*install_url*]
#   Specifies the url from which the wordpress tarball should be downloaded.
#   Default: http://wordpress.org
#
# [*version*]
#   Specifies the version of wordpress to install. Default: 3.5
#
# [*create_db*]
#   Specifies whether to create the db or not. Default: true
#
# [*create_db_user*]
#   Specifies whether to create the db user or not. Default: true
#
# [*db_name*]
#   Specifies the database name which the wordpress module should be configured
#   to use. Default: wordpress
#
# [*db_host*]
#   Specifies the database host to connect to. Default: localhost
#
# [*db_user*]
#   Specifies the database user. Default: wordpress
#
# [*db_password*]
#   Specifies the database user's password in plaintext. Default: password
#
# [*wp_owner*]
#   Specifies the owner of the wordpress files. Default: root
#
# [*wp_group*]
#   Specifies the group of the wordpress files. Default: 0 (*BSD/Darwin
#   compatible GID)
#
# [*wp_lang*]
#   WordPress Localized Language. Default: ''
#
#
# [*wp_plugin_dir*]
#   WordPress Plugin Directory. Full path, no trailing slash. Default: WordPress Default
#
# [*wp_proxy*]
#   Use a proxy with Wordpress for updates, plugins etc.  Default: false
#
# [*wp_proxy_host*]
#   Hostname or IP of the proxy server to use. Default: ''
#
# [*wp_proxy_port*]
#   Port to use with the proxy.  Default: ''
#
# [*wp_multisite*]
#   Boolean.  Use multisite with wordpress?  If set, this requires wp_site_domain.  Default: false
#
# [*wp_site_domain*]
#   DOMAIN_CURRENT_SITE that will be used when configuring multisite.  Typically this is just your base blog.  Default: ''
#
# === Requires
#
# === Examples
#
class wordpress (
  $install_dir    = '/opt/wordpress',
  $install_url    = 'http://wordpress.org',
  $version        = '3.5',
  $create_db      = true,
  $create_db_user = true,
  $db_name        = 'wordpress',
  $db_host        = 'localhost',
  $db_user        = 'wordpress',
  $db_password    = 'password',
  $wp_owner       = 'root',
  $wp_group       = '0',
  $wp_lang        = '',
  $wp_plugin_dir  = 'DEFAULT',
  $wp_proxy       = false,
  $wp_proxy_host  = '',
  $wp_proxy_port  = '',
  $wp_multisite   = false,
  $wp_site_domain = '',
) {
  anchor { 'wordpress::begin': }
  -> class { 'wordpress::app':
    install_dir    => $install_dir,
    install_url    => $install_url,
    version        => $version,
    db_name        => $db_name,
    db_host        => $db_host,
    db_user        => $db_user,
    db_password    => $db_password,
    wp_owner       => $wp_owner,
    wp_group       => $wp_group,
    wp_lang        => $wp_lang,
    wp_plugin_dir  => $wp_plugin_dir,
    wp_proxy       => $wp_proxy,
    wp_proxy_host  => $wp_proxy_host,
    wp_proxy_port  => $wp_proxy_port,
    wp_multisite   => $wp_multisite,
    wp_site_domain => $wp_site_domain,
  }
  -> class { 'wordpress::db':
    create_db      => $create_db,
    create_db_user => $create_db_user,
    db_name        => $db_name,
    db_host        => $db_host,
    db_user        => $db_user,
    db_password    => $db_password,
  }
  -> anchor { 'wordpress::end': }
}

