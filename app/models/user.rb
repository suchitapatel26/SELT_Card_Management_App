class User < ActiveRecord::Base
  validates :account_id, uniqueness: true
  def self.from_omniauth(auth)
    where(provider: auth[:provider], uid: auth[:uid]).first_or_initialize.tap do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.account_id = rand(10 ** 8)
      user.name = auth[:info][:name]
      user.email = auth[:info][:email]
      user.session_token = SecureRandom.base64
      user.save!
    end
  end
end