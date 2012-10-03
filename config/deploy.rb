set :application, "admin.okbrisbane.com"
#set :repository,  "ssh://git@192.168.0.6/home/git/repository/admin.okbrisbane.git"
set :repository,  "/var/www/html/okqld/admin.okbrisbane"
set :deploy_via, :copy
set :user, 'okbrisba'
set :use_sudo, false

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "okbrisbane.com"                          # Your HTTP server, Apache/etc
role :app, "okbrisbane.com"                          # This may be the same as your `Web` server
role :db,  "okbrisbane.com", :primary => true # This is where Rails migrations will run
#role :db,  "localhost"

set :deploy_to, "/home/okbrisba/#{application}"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end