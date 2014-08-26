name              "alm"
maintainer        "Martin Fenner"
maintainer_email  "mfenner@plos.org"
license           "Apache 2.0"
description       "Configures ALM server"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "2.0.0"
depends           "git"
depends           "mysql"
depends           "database"
depends           "couchdb"

%w{ ubuntu }.each do |platform|
  supports platform
end
