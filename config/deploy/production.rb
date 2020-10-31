set :branch, 'master'
set :stage, :production

# Setting RAILS_ENV environment variable on server
set :rails_env, :production

set :normalize_asset_timestamps, %{public/images public/s public/stylesheets}
 
role :app, %w{ubuntu@13.233.250.227}

# Force rake through bundle exec
SSHKit.config.command_map[:rake] = "bundle exec rake"

# Force rails through bundle exec
SSHKit.config.command_map[:rails] = "bundle exec rails"


namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "chmod 777 -R #{shared_path}/tmp"
      execute "sudo service apache2 restart"
    end
  end

  after :finishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end 
