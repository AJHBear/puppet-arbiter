# arbiter class
#
# @param arbiter_name
#   The actual name of the Arbiter install. Default value: `arbiter2`.
#
# @param config_file
#   The main Arbiter configuration file. Default value: `config.toml`.
#
# @param config_dir
#   Sets the directory where the Arbiter main configuration file is located.
#
# @param config_debug
#   Sets the debug setting in the main config file.
#
# @param package_ensure
#   Controls the `package` resource's `ensure` attribute. Valid values are: `absent`, `installed`
#   (or equivalent `present`), or a version string.
#
# @param package_manage
#   Whether to manage the Arbiter package. Default value: true.
#
# @param package_name
#   Specifies the Arbiter package to manage. Default value: ['arbiter2'].
#
# @param debug_mode
#   Whether to to run in debug mode.
#
# @param version
#   The version of Arbiter installed.
#
# @param debug_mode_override
#   Whether the debug override has been set.
#
# @param no_user_emails
#   Whether to disable emails sent to users
#
# @param service_name
#   The Arbiter service to manage. Default value: `arbiter2`.
#
# @param service_manage
#   Whether to manage the Arbiter service.  Default value: true.
#
# @param service_enable
#   Whether to enable the Arbiter service at boot. Default value: true.
#
# @param service_ensure
#   Whether the Arbiter service should be running. Default value: 'running'.
#
# @param service_restart
#   Determines whether Puppet should use a specific command to restart the service.
#   Values: a command to restart the Arbiter service.
#
#
class arbiter (
  String                                    $arbiter_name        = $arbiter::params::arbiter_name,
  String                                    $service_name        = $arbiter::params::service_name,
  Boolean                                   $service_enable      = true,
  Boolean                                   $service_manage      = true,
  Optional[String]                          $service_restart     = undef,
  Variant[Stdlib::Ensure::Service, Boolean] $service_ensure      = 'running',
  String                                    $config_dir          = $arbiter::params::config_dir,
  String                                    $config_file         = $arbiter::params::config_file,
  String                                    $config_debug        = $arbiter::params::config_debug,
  String                                    $package_ensure      = $arbiter::params::package_ensure,
  Boolean                                   $package_manage      = $arbiter::params::package_manage,
  Array[String]                             $package_name        = $arbiter::params::package_name,
  Boolean                                   $debug_mode          = $arbiter::params::debug_mode,
  Boolean                                   $debug_mode_override = $arbiter::params::debug_mode_override,
  Boolean                                   $no_user_emails      = $arbiter::params::no_user_emails,
  String                                    $version             = '2.1.0',
) inherits arbiter::params {
  include arbiter::install
  include arbiter::config

  class { 'arbiter::service':
    service_name    => $service_name,
    service_enable  => $service_enable,
    service_manage  => $service_manage,
    service_ensure  => $service_ensure,
    service_restart => $service_restart,
  }
}
