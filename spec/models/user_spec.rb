require 'rails_helper'

RSpec.describe User, type: :model do
  it 'needs a name' do
    expect(FactoryGirl.build(:user, username: '')).to_not be_valid
  end
end
