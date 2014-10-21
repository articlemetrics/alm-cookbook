# install and configure dependencies
include_recipe "apt"
include_recipe "couchdb"
include_recipe "memcached"
include_recipe "postfix"
include_recipe "phantomjs"

# load .env configuration file with ENV variables
# copy configuration file to shared folder
dotenv 'lagotto' do
  action          [:load, :copy]
end

puts ENV['COUCHDB_HOST']

# install mysql and create configuration file and database
mysql_rails 'lagotto' do
  username        ENV['DB_USERNAME']
  password        ENV['DB_PASSWORD']
  host            ENV['DB_HOST']
  action          :create
end

# create CouchDB database
bash "create CouchDB database" do
  code            "curl -X PUT http://#{ENV['COUCHDB_HOST']}:5984/lagotto"
  returns         [0, 127]
end

# install nginx and create configuration file and application root
passenger_nginx 'lagotto' do
  user            ENV['DEPLOY_USER']
  group           ENV['DEPLOY_GROUP']
  rails_env       ENV['RAILS_ENV']
  action          :config
end

# create required files and folders, and deploy application
capistrano 'lagotto' do
  user            ENV['DEPLOY_USER']
  group           ENV['DEPLOY_GROUP']
  rails_env       ENV['RAILS_ENV']
  action          [:config, :bundle_install, :precompile_assets, :migrate, :restart]
end
