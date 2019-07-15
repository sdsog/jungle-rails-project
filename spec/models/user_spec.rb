# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'new user can be created' do
      user = User.create(
        name: 'name',
        email: 'test1@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'user should have a first name' do
      user = User.create(
        name: 'name',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: nil
      )
      expect(user).to_not be_valid
    end

    it 'user should have name' do
      user = User.create(
        name: nil,
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'user should have unique email' do
      @user1 = User.create(
        name: 'name',
        email: 'test@test.com',
        password_digest: 'test'
      )
      @user2 = User.create(
        name: 'name',
        email: 'test@TEST.com',
        password_digest: 'test'
      )
      expect(@user2).to_not be_valid
    end

    it 'user should have matching password and password_confirmation' do
      password = User.create(
        name: 'name',
        email: 'test@test.com',
        password: 'password1',
        password_confirmation: 'password2'
      )
      expect(password).to_not be_equal(password.password_confirmation)
    end

    it 'passwords should have a minimum length of 3' do
      user = User.create(
        name: 'name',
        email: 'test@test.com',
        password: '12',
        password_confirmation: '12'
      )
      expect(user).to_not be_valid
    end
  end

  describe '.credentials_checker' do
    it 'expects user to be able to login with correct credentials' do
      user = User.create(
        name: 'name',
        email: 'test1@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      valid_user = User.credentials_checker('test1@test.com', 'password')
      expect(valid_user).to eq(user)
    end

    it 'should not authenticate if password and email are valid' do
      user = User.create(
        name: 'name',
        email: 'test1@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      invalid_user = User.credentials_checker('fail@test.com', 'password')
      expect(invalid_user).to_not eq(user)
    end

    it 'should not authenticate if email contains capitals' do
      user = User.create(
        name: 'name',
        email: 'test1@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      valid_user = User.credentials_checker('TEST1@test.com', 'password')
      expect(valid_user).to eq(user)
    end

    it 'should authenticate if email contains spaces' do
      user = User.create(
        name: 'name',
        email: 'test1@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      valid_user = User.credentials_checker(' test1@test.com   ', 'password')
      expect(valid_user).to eq(user)
    end
  end
end
