# frozen_string_literal: true

# set :default_env, { _CAPISTRANO: true }
#
# desc 'Load remote environment'
# task :load_remote_environment do
#   on roles(:app, :db, :web) do
#     with _CAPISTRANO: false do
#       run "cd #{current_path} && #{rake} RAILS_ENV=#{rails_env} qwe)"
#     end
#   end
# end
desc 'Seed the database.'
task :task_db do
  on roles(:app) do
    within current_path.to_s do
      with rails_env: :production do
        execute :rake, 'task:insert'
      end
    end
  end
end
