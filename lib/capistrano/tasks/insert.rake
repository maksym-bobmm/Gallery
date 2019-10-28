# frozen_string_literal: true

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
