set :deploy_to, "/home/user/www/sites/dtgdev"
namespace :deploy do

  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :bundle do
    run "cd #{release_path} && bundle install --gemfile #{release_path}/Gemfile"
  end

  task :assets do
    run "cd #{release_path} && bundle exec rake RAILS_ENV=production RAILS_GROUPS=assets assets:precompile"
  end

  task :migrations do
    run "cd #{release_path} && bundle exec rake db:migrate RAILS_ENV=production"
  end

  # task :refresh_sitemaps do
  #   run "cd #{latest_release} && RAILS_ENV=#{rails_env} rake sitemap:refresh"
  # end
end
