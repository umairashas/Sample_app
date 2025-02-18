class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :send_welcome_email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :github, :linkedin]
  has_many :todos, dependent: :destroy 

  

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20] # Generate a random password
      #user.name = auth.info.name # Assuming the user model has a name attribute
      # Add any other attributes you want to set from the OAuth data
    end
  end

  def send_welcome_email
        UserMailer.welcome_email(self).deliver_now
  end

end
