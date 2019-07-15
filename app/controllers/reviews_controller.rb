# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    @average_review = Review.average(:rating)

    review = Review.new(review_params)
    review.user_id = session[:user_id]
    review.product_id = params[:product_id]

    if review.save
      review.save
      redirect_to "/products/#{params[:id]}"
    else
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  def destroy
    @product = params[:product_id]
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_url(params[:product_id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
