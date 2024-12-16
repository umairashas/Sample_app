class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook]
  has_many :todos, dependent: :destroy 

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first_or_initialize
    user.name = auth.info.name
    user.image = auth.info.image
    user.uid = auth.uid
    user.provider = auth.provider
    user.password = Devise.friendly_token[0, 20] if user.new_record?
    user.save
    user
  end
end
