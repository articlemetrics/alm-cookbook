require 'securerandom'

default['user'] = 'vagrant'
default['ruby']['packages'] = %w{ libxml2-dev libxslt-dev libmysqlclient-dev nodejs libpq-dev }

default['alm']['name'] = "alm"
default['alm']['deploy_user'] = 'vagrant'
default['alm']['group'] = 'vagrant'
default['alm']['rails_env'] = "development"
default['alm']['web'] = { 'default_server' => true }
default['alm']['db'] = {
  'user' => 'vagrant',
  'password' => SecureRandom.hex(10),
  'host' => '127.0.0.1' }
default['alm']['couchdb'] = { 'url' => 'http://127.0.0.1:5984/alm' }

# config/settings.yml
default['alm']['settings'] = {
  "useragent"  => "Article-Level Metrics",
  "api_key"    => SecureRandom.hex(20),
  "uid"        => "doi",
  "doi_prefix" => "",
  "key"        => SecureRandom.hex(30),
  "secret"     => SecureRandom.hex(30),
  "persona"    => true,
  "cas_url"    => "https://example.org",
  "cas_prefix" => "/cas",
  "workers"    => 3,
  "mail"       => { address: "localhost", port: 25, domain: "localhost", enable_starttls_auto: true }
}

# db/seeds/_custom_sources.rb
default['alm']['sources'] = {
  "counter"          => { url: nil },
  "mendeley"         => { client_id: nil, secret: nil },
  "pmc"              => { url: nil, journals: nil, username: nil, password: nil },
  "f1000"            => {},
  "facebook"         => { access_token: nil },
  "twitter_search"   => { access_token: nil },
  "crossref"         => { username: nil, password: nil },
  "researchblogging" => { username: nil, password: nil },
  "scopus"           => { api_key: nil, insttoken: nil },
  "copernicus"       => {},
  "admin"            => { username: "articlemetrics", name: "Admin", email: "admin@example.com", password: nil }
}

