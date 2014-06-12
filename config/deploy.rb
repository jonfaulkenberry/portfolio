require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina_sidekiq/tasks'

set :domain, ENV['MINA_DOMAIN']
set :user, ENV['MINA_USER']
set :port, ENV['MINA_PORT']
set :deploy_to, ENV['MINA_DEPLOY_TO']
set :repository, ENV['MINA_REPO']
set :branch, ENV['MINA_BRANCH']

set :shared_paths, ['config/database.yml', 'config/local_env.yml', 'config/sidekiq.yml', 'log']

task :environment do
  invoke :'rvm:use[ruby-2.1.1]'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]
  
  queue! %[mkdir -p "#{deploy_to}/shared/pids/"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/pids"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue! %[touch "#{deploy_to}/shared/config/local_env.yml"]
  queue! %[touch "#{deploy_to}/shared/config/sidekiq.yml"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'sidekiq:quiet'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'

    to :launch do
      queue 'sudo /etc/init.d/nginx restart'
      invoke :'sidekiq:restart'
    end
  end
end
