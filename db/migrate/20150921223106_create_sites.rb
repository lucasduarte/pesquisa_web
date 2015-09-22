class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string   "name",             limit: 255
      t.string   "link",             limit: 255
      t.string   "description",      limit: 255
      t.integer  "category_id",      limit: 4
      t.string   "product_link_tag", limit: 255
      t.string   "price_tag",        limit: 255
      t.string   "image_tag",        limit: 255
      t.string   "description_tag",  limit: 255
      t.string   "category_tag",     limit: 255
      t.boolean  "status"
      t.string   "logo",             limit: 500
      t.timestamps                   null: false
    end
  end
end
