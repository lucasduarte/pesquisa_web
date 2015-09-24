class AddForeignKeyToSite < ActiveRecord::Migration
  def change
    add_foreign_key :sites, :categories
  end
end
