class User < ApplicationRecord
  devise :registerable
  include Avatar

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  def self.find_or_create_from_auth_hash(auth)
    where(provider: auth.provider, uid: auth.uid, email: auth.info.email).first_or_create! do |user|
      user.provider = auth&.provider
      user.uid = auth&.uid
      user.email = auth&.info&.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  has_one_attached :avatar

  has_many :orders
  has_many :services, through: :orders
  has_one :address, as: :addressable
  has_many :companies
end
