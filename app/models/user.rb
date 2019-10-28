# frozen_string_literal: true

# user model
class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  validates_presence_of :email #:first_name
  has_many :categories, dependent: :destroy, foreign_key: 'owner_id'
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
      data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
      user.email = data['email'] if data && user.email.blank?
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.logins_before_captcha
    3
  end

  def permitted_params
    params.permit!
  end

  def to_s
    email
  end
end
