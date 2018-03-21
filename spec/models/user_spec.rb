require 'rails_helper'

describe User do

  it 'returns the location as a single string' do
    user = build(:user, city: 'New Albany', state: "OH")
    expect(user.location).to eq('New Albany, OH')
  end

end
