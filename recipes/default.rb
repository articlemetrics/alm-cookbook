# load .env configuration file with ENV variables
# copy configuration file to shared folder
dotenv node["application"] do
  dotenv          node["dotenv"]
  action          :nothing
end.run_action(:load)

# install and configure dependencies
include_recipe "apt"
include_recipe "couchdb"
include_recipe "redisio"
include_recipe "redisio::enable"
include_recipe "memcached"
include_recipe "postfix"
include_recipe "nodejs"

# install mysql and create configuration file and database
mysql_rails ENV['DB_NAME'] do
  username        ENV['DB_USERNAME']
  password        ENV['DB_PASSWORD']
  host            ENV['DB_HOST']
  root_password   ENV['DB_ROOT_PASSWORD']
  action          :create
end

# create CouchDB database
bash "create CouchDB database" do
  code            "curl -X PUT #{ENV['COUCHDB_URL']}"
  returns         [0, 127]
end

# install nginx and create configuration file and application root
passenger_nginx ENV['APPLICATION'] do
  user            ENV['DEPLOY_USER']
  group           ENV['DEPLOY_GROUP']
  rails_env       ENV['RAILS_ENV']
  action          :config
end

# create required files and folders, and deploy application
capistrano ENV['APPLICATION'] do
  user            ENV['DEPLOY_USER']
  group           ENV['DEPLOY_GROUP']
  rails_env       ENV['RAILS_ENV']
  action          [:config, :bundle_install, :npm_install, :precompile_assets, :migrate, :restart]
end

# monitor httpd service
consul_service_watch_def 'nginx' do
  passingonly true
  handler "chef-client"
end

consul_service_def 'nginx' do
  port 80
  tags ['http']
  check(
    interval: '10s',
    http: "#{ENV['HOSTNAME']}:80"
  )
  notifies :reload, 'service[consul]'
end
