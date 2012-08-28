#!/bin/bash
DATE=`date +%Y%m%d`
tar jcvf okbrisbane_$DATE.tar.bz2 app config/locales config/environments/production.rb config/routes.rb config/application.rb config/boot.rb config/environment.rb db Gemfile lib seed_db.sh
