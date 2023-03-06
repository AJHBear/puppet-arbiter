# @summary
#   This class handles the configuration file.
#
# @api private
#
class arbiter::config (
  Boolean $debug_mode          = $arbiter::debug_mode,
  Boolean $debug_mode_override = $arbiter::debug_mode_override,
  Boolean $no_user_emails      = $arbiter::$no_user_emails,
  String  $config_dir          = $arbiter::config_dir,
  String  $config_file         = $arbiter::config_file,
  String  $config_debug        = $arbiter::config_debug,
  String  $version             = $arbiter::version,
) {
  if debug_mode {
    file_line { 'Set Debug Mode in config.toml':
      ensure => present,
      path   => "${config_dir}/${version}/etc/${config_file}",
      line   => "debug_mode = ${debug_mode}",
      match  => '^debug_mode',
    }
  }
  if arbiter::debug_mode_override {
    file_line { 'Set Debug Mode in _debug.toml':
      ensure => present,
      path   => "${config_dir}/${version}/etc/${config_debug}",
      line   => "debug_mode = ${debug_mode_override}",
      match  => '^debug_mode',
    }
  }
  if arbiter::no_user_emails {
    file_line { 'Set No User Emails in config.toml':
      ensure => present,
      path   => "${config_dir}/${version}/etc/${config_file}",
      line   => "no_user_emails = ${no_user_emails}",
      match  => '^no_user_emails',
    }
  }
}
