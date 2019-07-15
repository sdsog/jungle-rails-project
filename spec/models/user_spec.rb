# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'user can be created' do
      user = User.create(
        name: 'name',
        email: 'test@test.com',
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
end
