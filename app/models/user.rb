# frozen_string_literal: true

class User < ApplicationRecord
  has_many :categories, dependent: :destroy, foreign_key: 'owner_id'
  attr_accessor :cached_failed_attempts
  has_many :comments
  has_many :likes, dependent: :delete_all
  has_many :subscriptions, dependent: :delete_all
  has_many :images, through: :likes
  has_many :logs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable,
         :database_authenticatable,
         :registerable, :lockable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.logins_before_captcha
    3
  end
  # ransacker :filter_user,
  #           :formatter => -> (v) {
  #             ids = User.where(email: v).pluck(:id);
  #             ids.present? ? ids : nil
  #           } do |parent|
  #   parent.table[:id]
  # end

  # def to_s
  #   self.email
  # end
end
