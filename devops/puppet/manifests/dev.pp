node 'dev' inherits basenode {
  $app_name = "elixir-test"
  $app_password = "elixir-test"
  
  class { 'elixir': 
    version => '1.0.4',
  }

  # install postgresql db
  # package { 'libpq-dev':
  #   ensure    => installed,
  # }

  # class { 'postgresql::server':
  # }

  # postgresql::server::db { "${app_name}_development":
  #   user     => "${app_name}",
  #   password => postgresql_password("${app_name}", "${app_password}"),
  # }

  # postgresql::server::db { "${app_name}_test":
  #   user     => "${app_name}",
  #   password => postgresql_password("${app_name}", "${app_password}"),
  # }

  # postgresql::server::role { "${app_name}":
  #   password_hash => postgresql_password("${app_name}", "${app_password}"),
  #   # createdb => true,
  #   superuser => true
  # }
}