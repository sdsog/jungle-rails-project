# frozen_string_literal: true

class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD'], except: :index
  def index
    @category = Category.order(:name).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to %i[admin categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to %i[admin categories], notice: 'Category deleted!'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
