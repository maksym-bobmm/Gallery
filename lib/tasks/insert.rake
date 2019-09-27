# frozen_string_literal: true

namespace :task do
  task insert: :environment do
    folder_path = File.join(Rails.root, 'app', 'assets', 'images', 'categories/')
    Dir.entries(folder_path).reject { |f| f =~ /^(\.|\.\.)$/ }.each do |item|
      next if item.to_i.to_s == item # Not numeric name

      category = Category.create!(owner_id: 1, name: item)
      Dir.entries(folder_path + item).reject { |f| f =~ /^(\.|\.\.)$/ }.each do |image|
        Pathname.new(File.join(folder_path.to_s, item.to_s, image.to_s)).open do |img_path|
          category.images.create!(path: img_path)
        end
      end
    end
  end
end
