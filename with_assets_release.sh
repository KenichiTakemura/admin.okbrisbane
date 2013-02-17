#!/bin/bash
DATE=`date +%Y%m%d%H%M`
tar jcvfh ../release/admin_okbrisbane_$DATE.tar.bz2\
 app/controllers\
 app/helpers\
 app/mailers\
 app/models\
 app/views\
 script\
 config/routes.rb\
 config/application.rb\
 config/boot.rb\
 config/environment.rb\
 config/initializers/okbrisbane.rb\
 db\
 lib\
 public/*html\
 public/favicon.ico\
 public/assets\
 public/images\
 public/javascripts\
 public/robots.txt\
 vendor/gems
#mv tmp/release/manifest.yml tmp/release/manifest.yml.$DATE
#cp -p public/assets/manifest.yml tmp/release
mv public/assets public/x_assets
