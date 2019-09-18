namespace :task do
  task :insert => :environment do
    folder_path = File.join(Rails.root, 'assets', 'images', 'categories/')
    Dir.entries(folder_path).reject{|f| f=~/^(\.|\.\.)$/}.each do |item|
      unless item.to_i.to_s == item # Not numeric name
        category = Category.create!(owner_id: 1, name: item)
        Dir.entries(folder_path + item).reject{|f| f=~/^(\.|\.\.)$/}.each do |image|
          Pathname.new(File.join("#{folder_path}", "#{item}", "#{image}")).open do |img_path|
            category.images.create!(path: img_path)
          end
        end
      end
    end
  end
end
