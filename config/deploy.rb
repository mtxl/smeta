# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'smeta'
set :repo_url, ' git@bitbucket.org:mtxl/smeta.git'
set :deploy_to, '/srv/www/smeta'
set :linked_files, fetch(:linked_files, []).push('config/application.yml')

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

namespace :figaro do
  desc "SCP transfer figaro configuration to the shared folder"
  task :setup do
    on roles(:app) do
      upload! "config/application.yml", "#{shared_path}/config/application.yml", via: :scp
    end
  end
   
  desc "Symlink application.yml to the release path"
  task :symlink do
    on roles(:app) do
      execute "ln -sf #{shared_path}/config/application.yml #{current_path}/config/application.yml"
    end
  end
end
after "deploy:started", "figaro:setup"
after "deploy:symlink:release", "figaro:symlink"
