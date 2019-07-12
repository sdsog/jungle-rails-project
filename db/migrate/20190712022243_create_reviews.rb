# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.reference :product_id
      t.reference :user_id
      t.text :description
      t.integer :rating
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
