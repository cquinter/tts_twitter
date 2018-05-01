require 'rails_helper'

describe User do

  it 'users have many tweets' do
    have_many :tweets #this is a shortcut that the gem shoulda matchers allows for
  end

  it 'users require unique usernames' do
    validate_uniqueness_of :username #again, this is a shortcut that the gem shoulda matchers allows for
  end

  it 'location method returns the location as a single string' do
    user = build(:user, city: 'New Albany', state: "OH")
    expect(user.location).to eq('New Albany, OH')
  end

end
