# frozen_string_literal: true

# categories helper
module CategoriesHelper
  def find_popular_image(category)
    category.images.sort_by(&:likes_count).last
  end

  def button_for_subscribe
    link_to t('site.category.subscribe'), subscriptions_path, method: :post, remote: true, 'data-turbolinks': 'false',
            class: 'btn btn-secondary d-table-cell', id: 'category-subscribe'
  end

  def button_for_unsubscribe(category_id)
    link_to t('site.category.unsubscribe'), subscription_path(category_id), method: :delete, remote: true, 'data-turbolinks': 'false',
            class: 'btn btn-secondary d-table-cell', id: 'category-unsubscribe'
  end
end
