# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  username            :string           not null
#  email               :string           not null
#  password_digest     :string           not null
#  session_token       :string           not null
#  language            :string           default("none")
#  uid                 :string
#  provider            :string
#  created_at          :datetime
#  updated_at          :datetime
#  about_field_one     :text
#  about_field_two     :text
#  about_field_three   :text
#  age                 :integer
#  job                 :string
#  looking_for         :text
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'needs a name' do
    expect(FactoryGirl.build(:user, username: '')).to_not be_valid
  end

  it 'needs an email' do
    expect(FactoryGirl.build(:user, email: '')).to_not be_valid
  end

  it 'needs a properly formatted email' do
    expect(FactoryGirl.build(:user, email: "example")).to_not be_valid
  end

  it 'needs a password digest' do
    expect(FactoryGirl.build(:user, password_digest: '')).to_not be_valid
  end

  it 'needs a session token' do
    expect(FactoryGirl.build(:user, session_token: '')).to_not be_valid
  end

  it 'creates a valid user when proper inputs are provided' do
    expect(FactoryGirl.build(:user, username: "exampleman", email: "example@example.com", password: "password")).to be_valid
  end

  describe 'possesses all the correct associations' do
    it 'properly creates a user answer' do
      user = User.create!(username: "exampleman", email: "example@example.com", password: "password")
      answer = user.user_answers.create!(answer_choice_id: 1, weight: 10)
      expect(user.user_answers.length).to equal(1)
    end
  end
end
