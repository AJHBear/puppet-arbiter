# @summary
#   This class handles arbiter packages.
#
# @api private
#
class arbiter::install (
  String          $package_ensure      = $arbiter::package_ensure,
  Boolean         $package_manage      = $arbiter::package_manage,
  Array[String]   $package_name        = $arbiter::package_name,
) {
  if $package_manage {
    package { $package_name:
      ensure => $package_ensure,
    }
  }
}
