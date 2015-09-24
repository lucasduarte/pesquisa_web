class AddForeignKeyToProducts < ActiveRecord::Migration
  def change
    add_foreign_key :products, :sites
  end
end
