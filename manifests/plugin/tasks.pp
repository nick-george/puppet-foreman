# = Foreman Tasks
#
# Installs the foreman-tasks plugin
#
# === Parameters:
#
# $package:: Package name to install, use ruby193-rubygem-foreman-tasks on Foreman 1.8/1.9 on EL
#
# $service:: Service name
#
class foreman::plugin::tasks(
  String $package = $::foreman::plugin::tasks::params::package,
  String $service = $::foreman::plugin::tasks::params::service,
) inherits foreman::plugin::tasks::params {
  foreman::plugin { 'tasks':
    package => $package,
  }
  ~> service { 'foreman-tasks':
    ensure => running,
    enable => true,
    name   => $service,
  }
}
