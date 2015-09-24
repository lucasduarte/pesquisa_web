class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer  "user_id",    limit: 4
      t.string  "search_word",  limit: 255
      t.string   "category",   limit: 255
      t.decimal  "price",      precision: 10
      t.boolean  "email_sent"
      t.timestamps null: false
    end
  end
end
