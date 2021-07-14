# frozen_string_literal: true

# This table will cointain all news retrieved.
class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :category
      t.string :headline
      t.string :image
      t.string :related
      t.string :source
      t.string :url
      t.datetime :publish_date
      t.integer :external_id, index: { unique: true }
      t.text :summary

      t.timestamps
    end
  end
end
