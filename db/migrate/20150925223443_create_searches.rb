class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :search_word
      t.integer :count, default: 1
      t.timestamps null: false
    end
  end
end
