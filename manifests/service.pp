# @summary
#   Installs and configures Arbiter service.
#
# @api private
class arbiter::service (
  String $service_name                     = $arbiter::params::service_name,
  Boolean $service_enable                  = true,
  Variant[Boolean, String] $service_ensure = 'running',
  Boolean $service_manage                  = true,
  Optional[String] $service_restart        = undef
) {
  # The base class must be included first because parameter defaults depend on it
  if ! defined(Class['arbiter::params']) {
    fail('You must include the apache::params class before using any apache defined resources')
  }
  case $service_ensure {
    true, false, 'running', 'stopped': {
      $_service_ensure = $service_ensure
    }
    default: {
      $_service_ensure = undef
    }
  }

  $service_hasrestart = $service_restart == undef

  if $service_manage {
    service { 'arbiter2':
      ensure     => $_service_ensure,
      name       => $service_name,
      enable     => $service_enable,
      restart    => $service_restart,
      hasrestart => $service_hasrestart,
    }
  }
}