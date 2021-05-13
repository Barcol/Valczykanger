class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers: %i[facebook]

  has_many :participants
  has_many :melanges,  through: :participants

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.new(provider: auth.provider,
                      uid: auth.uid,
                      name: auth.info.name,
                      email: auth.info.email,
                      password: Devise.friendly_token[0, 20])
      user.skip_confirmation!
      user.save!
    end
    user
  end
end
