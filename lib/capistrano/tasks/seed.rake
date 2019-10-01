# frozen_string_literal: true

desc 'Seed the database.'
task :seed_db do
  on roles(:app) do
    within current_path.to_s do
      with rails_env: :production do
        execute :rake, 'db:seed'
      end
    end
  end
end
