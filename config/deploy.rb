 set :application, "pgapp.com"
 set :repository,  "https://github.com/gowrinaidur/pgapp.git"

 set :scm, :git
# # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

 set :user , 'deploy'
 set :user_sudo, true
 set :deploy_to , "/home/hb/Ngnix_Apps/pgapp"
 set :deploy_via , :remote_cache

 role :web, "pgapp.com"                          # Your HTTP server, Apache/etc
 role :app, "pgapp.com"                          # This may be the same as your `Web` server
 role :db,  "pgapp.com", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
after "deploy" ,"deploy:bundle_gems"
after "deploy:bundle_gems","deploy:restart"
namespace :deploy do
  task :bundle_gems do
  	run "cd #{deploy_to}/current && bundle install"
  end
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end


# require 'bundler/capistrano'
# set :user, 'pgapp'
# set :domain, 'www.gowripgapp.com'
# set :applicationdir, "/home/hb/Ngnix_Apps/pgapp"
 
# set :scm, 'git'
# set :repository,  "https://github.com/gowrinaidur/pgapp.git"
# set :git_enable_submodules, 1 # if you have vendored rails
# set :branch, 'master'
# set :git_shallow_clone, 1
# set :scm_verbose, true
 
# # roles (servers)
# role :web, domain
# role :app, domain
# role :db,  domain, :primary => true
 
# # deploy config
# set :deploy_to, applicationdir
# set :deploy_via, :export
 
# # additional settings
# default_run_options[:pty] = true  # Forgo errors when deploying from windows
# #ssh_options[:keys] = %w(/home/user/.ssh/id_rsa)            # If you are using ssh_keysset :chmod755, "app config db lib public vendor script script/* public/disp*"set :use_sudo, false
 
# # Passenger
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end