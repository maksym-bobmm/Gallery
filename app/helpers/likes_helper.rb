# frozen_string_literal: true

# likes helper
module LikesHelper
  def link_for_like
    link_to image_tag( 'unliked.svg', alt: t(:'site.image.like'), id: 'heart', 'data-turbolinks': 'false'),
            likes_path, method: :post, remote: true, id: 'image-like_link', class: 'ajax', 'data-turbolinks': 'false'
  end
  def link_for_unlike(image)
    link_to image_tag( 'liked.svg', alt: t(:'site.image.unlike'), id: 'heart', 'data-turbolinks': 'false'),
            like_path(image), method: :delete, remote: true, id: 'image-unlike_link', class: 'ajax', 'data-turbolinks': 'false'
  end
end
