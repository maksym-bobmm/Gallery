namespace :insert do
  task :images => :environment do
    folder_path = File.join(Rails.root, 'public', 'uploads', 'image/')
    Dir.entries(folder_path).reject{|f| f=~/^(\.|\.\.)$/}.each do |item|
      unless item.to_i.to_s == item # Not numeric name
        category = Category.create!(owner_id: 1, name: item)
        Dir.entries(folder_path + item).reject{|f| f=~/^(\.|\.\.)$/}.each do |image|
          # byebug
          ActiveRecord::Base.connection.execute(
              "INSERT INTO images(path, category_id, created_at) VALUES ('#{image}', #{category.id}, CURRENT_TIMESTAMP);")
          # Pathname.new(Rails.root.join("public/uploads/image/cars/#{image}")).open {|f| category.images.create!(path: f)}
          # img_file = Pathname.new(Rails.root.join("public/uploads/image/cars/#{image}")).open
          # category.images.create!(path: img_file)
          # img_file.close
        end
      end
    end
  end
end
