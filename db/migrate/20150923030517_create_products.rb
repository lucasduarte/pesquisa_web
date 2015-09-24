class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string   "search_word", limit: 255
      t.boolean  "status"
      t.decimal  "price",                   precision: 10
      t.string   "image_link",  limit: 500
      t.string   "description", limit: 500
      t.string   "category",    limit: 255
      t.string   "link",        limit: 500
      t.integer  "site_id",     limit: 4

      t.timestamps null: false
    end
  end
end
