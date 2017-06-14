require './spec/spec_helper'

describe 'User', type: :model do
  context 'attribute validation' do
    it 'has valid attributes' do
      user = FactoryGirl.build :user
      expect(user).to be_valid
    end

    it 'cannot create duplicate primary key' do
      FactoryGirl.create :user
      user = FactoryGirl.build :user
      expect(user).to be_invalid
    end

    it 'is invalid without username' do
      user = FactoryGirl.build(:user, username: nil)
      expect(user).to be_invalid
    end

    it 'is invalid without email' do
      user = FactoryGirl.build(:user, email: nil)
      expect(user).to be_invalid
    end

    it 'is invalid without name' do
      user = FactoryGirl.build(:user, name: nil)
      expect(user).to be_invalid
    end
  end
end
