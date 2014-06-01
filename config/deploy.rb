require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina_extensions/sidekiq'

set :domain, 'wfe.jonfaulkenberry.com'
set :user, 'jon'
set :port, '8064'
set :deploy_to, '/var/www/jonfaulkenberry.com'
set :repository, 'https://github.com/jonfaulkenberry/portfolio.git'
set :branch, 'master'

set :shared_paths, ['config/database.yml, config/local_env.yml', 'log']

task :environment do
  invoke :'rvm:use[ruby-2.1.1]'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]
  
  queue! %[touch "#{deploy_to}/shared/config/local_env.yml"]
  queue  %[echo "-----> Be sure to edit 'shared/config/local_env.yml'."]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'sidekiq:restart'

    to :launch do
      queue "sudo /home/jon/restart_nginx"
    end
  end
end
