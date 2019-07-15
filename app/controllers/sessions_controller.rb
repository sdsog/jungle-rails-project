# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    if user = User.credentials_checker(params[:email].strip, params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = 'There was an error with your credentials. Please try again.'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
