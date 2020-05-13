require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(username: 'dracula', email: 'drac@trans.com', password: '123456789')
    expect(user).to be_valid
  end

  it 'is invalid without a username' do
    user = User.new(username: nil, email: 'drac@trans.com', password: '123456789')
    expect(user).to_not be_valid
  end

  it 'is invalid without an email' do
    user = User.new(username: 'dracula', email: nil, password: '123456789')
    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user = User.new(username: 'dracula', email: 'drac@trans.com')
    expect(user).to_not be_valid
  end

  it 'is invalid if the password is too short' do
    user = User.new(username: 'dracula', email: 'drac@trans.com', password: '1234')
    expect(user).to_not be_valid
  end

  it 'is invalid with a duplicate username' do
    User.new(username: 'dracula', email: 'drac@trans.com', password: '123456789').save
    user = User.new(username: 'dracula', email: 'drac@bats.com', password: '123456789')
    expect(user).to_not be_valid
  end

  it 'is invalid with a duplicate email' do
    User.new(username: 'dracula', email: 'drac@trans.com', password: '123456789').save
    user = User.new(username: 'batty', email: 'drac@trans.com', password: '123456789')
    expect(user).to_not be_valid
  end

  it { should have_many(:pictures) }
end