require 'bundler/capistrano'

set :application, "dziegler"
set :repository,  "git://github.com/dzieglersf/dziegler.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'bitnami'
set :use_sudo, false
set :deploy_to, "/opt/bitnami/apps/#{application}"
# set :deploy_via, :remote_cache

role :web, "23.21.146.77"                          # Your HTTP server, Apache/etc
role :app, "23.21.146.77"                          # This may be the same as your `Web` server
role :db,  "23.21.146.77", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:restart"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
	task :bundle_gems do
		run "cd #{deploy_to}/current"
	end
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end