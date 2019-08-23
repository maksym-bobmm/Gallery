# frozen_string_literal: true

ActiveAdmin.register Image do
  remove_filter :comments
  remove_filter :likes
end
