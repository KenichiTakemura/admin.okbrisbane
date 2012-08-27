#!/bin/bash
DATE=`date +%Y%m%d`
tar jcvf adim_okbrisbane_$DATE.tar.bz2 app config/locales config/routes.rb db Gemfile lib
