require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    auth = {
      provider: "google",
      uid: "12345678910",
      info: {
        email: "selt@gmail.com",
        name: "selttest",
      }
    }
    User.from_omniauth(auth)
    new_user = User.first
    expect(new_user.provider).to eq('google')
    expect(new_user.uid).to eq('12345678910')
    expect(new_user.email).to eq('selt@gmail.com')
    expect(new_user.name).to eq('selttest')
  end
end
