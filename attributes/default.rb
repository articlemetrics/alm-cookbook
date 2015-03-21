default['ruby']['packages'] = %w{ curl git libmysqlclient-dev python-software-properties software-properties-common }
default['ruby']['packages'] += %w{ avahi-daemon libnss-mdns } if ENV['RAILS_ENV'] != "production"
default["dotenv"] = "default"
default["application"] = "lagotto"
default['ruby']['merge_slashes_off'] = true
default['ruby']['api_only'] = false
default['couch_db']['config']['httpd']['bind_address'] = "0.0.0.0" if ENV['RAILS_ENV'] != "production"
default['nodejs']['install_method'] = "binary"
default['nodejs']['version'] = "0.10.33"
default['nodejs']['binary']['checksum']['linux_x64'] = "159e5485d0fb5c913201baae49f68fd428a7e3b08262e9bf5003c1b399705ca8"
default['nodejs']['npm']['version'] = "1.4.28"
default['nodejs']['npm_packages'] = [{ "name" => "phantomjs" },
                                     { "name" => "istanbul"},
                                     { "name" => "codeclimate-test-reporter" }]
