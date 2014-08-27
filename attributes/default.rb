default['alm']['host'] = "33.33.33.44"
default['alm']['useragent'] = "Article-Level Metrics"
default['alm']['api_key'] = nil
default['alm']['admin'] = { username: "articlemetrics", name: "Admin", email: "admin@example.com", password: nil }
default['alm']['mail'] = { address: "localhost", port: 25, domain: "localhost", enable_starttls_auto: true }
default['alm']['uid'] = "doi"
default['alm']['doi_prefix'] = ""
default['alm']['key'] = nil
default['alm']['secret'] = nil
default['alm']['persona'] = true
default['alm']['cas_url'] = "https://example.org"
default['alm']['cas_prefix'] = "/cas"
default['alm']['user'] = "vagrant"
default['alm']['group'] = "www-data"
default['alm']['workers'] = 3
default['alm']['counter'] = { url: nil }
default['alm']['mendeley'] = { client_id: nil, secret: nil }
default['alm']['pmc'] = { url: nil, journals: nil, username: nil, password: nil }
default['alm']['f1000'] = {}
default['alm']['facebook'] = { access_token: nil }
default['alm']['twitter_search'] = { access_token: nil }
default['alm']['crossref'] = { username: nil, password: nil }
default['alm']['copernicus'] = { url: nil, username: nil, password: nil }
default['alm']['researchblogging'] = { username: nil, password: nil }
default['alm']['scopus'] = { api_key: nil, insttoken: nil }

default['capistrano']['application'] = "alm"
default['capistrano']['rails_env'] = "development"

default['couch_db']['config']['httpd']['port'] = 5984

default['phantomjs']['version'] = "1.9.7"
default['phantomjs']['base_url'] = "https://bitbucket.org/ariya/phantomjs/downloads"
