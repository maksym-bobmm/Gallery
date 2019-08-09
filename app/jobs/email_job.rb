class EmailJob
  @queue = :email

  def self.perform(category_id)
    users = User.joins(:subscriptions).where(subscriptions: {category_id: category_id }).pluck(:email)

    # todo do the same with this format
    # ActionMailer::Base.mail(to: 'maksym.bobmm@gmail.com', subject: 'New Image on your subscriptions') do |format|
    #   format.text { render plain: "Welcome" }
    #   format.html { render html: "<h1>Welcome</h1>".html_safe }
    # end

    mail = ActionMailer::Base.mail(to: 'maksym.bobmm@gmail.com',
                                   from: 'asd@asd.asd',
                                   subject: 'New Image on your subscriptions',
                                   template_path: 'user_mailer',
                                   template_name: 'new_image_in_category')
    mail.deliver
  end
end