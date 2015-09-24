class AddForeignKeyToAlerts < ActiveRecord::Migration
  def change
    add_foreign_key :alerts, :users
  end
end
