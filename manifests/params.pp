# @summary
#   This class manages Apache parameters
#
# @api private
class arbiter::params inherits arbiter::version {
  if($facts['networking']['fqdn']) {
    $servername = $facts['networking']['fqdn']
  } else {
    $servername = $facts['networking']['hostname']
  }
  # Arbiter version number
  $version = '2.1.0'

  # The default error log level
  $log_level = 'warn'

  # should we use systemd module?
  $use_systemd = true

  # Default mode for files
  $file_mode = '0644'

  # The default value for host hame lookup
  $hostname_lookups = 'Off'

  # Default options for / directory
  $root_directory_options = ['FollowSymLinks']

  # Default name
  $arbiter_name = 'arbiter2'

  # Default service name
  $service_name = 'arbiter2'

  # Main config dir 
  $config_dir = '/usr/local/src/arbiter2/'

  # Main config file
  $config_file = 'config.toml'

  # Debug config override
  $config_debug = '_debug.toml'

  # Package required state
  $package_ensure = 'present'

  # Package management
  $package_manage = true

  # Package name
  $package_name = ['arbiter2']

  # Debug mode
  $debug_mode = true

  # Debug override
  $debug_mode_override = true

  # Disable email sent to users and insted send to admin
  $no_user_emails = true
}
