# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'newrailsblogpw'
set :repo_url, 'https://github.com/bobanuk/newrailsblogpw.git'
set :deploy_to, '/var/www/newrailsblogpw'
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :format, :pretty
set :log_level, :info
set :stage, :production
set :branch, 'master'
set :format, :pretty
set :rails_env, :production
set :scm, :git
set :keep_releases, 3

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  task :symlink_uploads do
    run "rm -rf #{release_path}/rails/public/uploads} && ln -nfs #{shared_path}/rails/uploads  #{release_path}/rails/public/uploads"
  end

  after :publishing, :restart


end
