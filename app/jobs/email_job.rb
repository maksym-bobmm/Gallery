# frozen_string_literal: true

class EmailJob
  @queue = :email

  def self.perform(category_id)
    UserMailer.with(category_id: category_id).new_image_in_category.deliver_later
    # TODO do the same with this format
    # ActionMailer::Base.mail(to: 'maksym.bobmm@gmail.com', subject: 'New Image on your subscriptions') do |format|
    #   format.text { render plain: "Welcome" }
    #   format.html { render html: "<h1>Welcome</h1>".html_safe }
    # end
  end
end
