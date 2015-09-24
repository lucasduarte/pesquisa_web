class Product < ActiveRecord::Base
  belongs_to :site
  validates :site, presence: true

  def Product.price_history search_word
    products = Product.select("min(price) price, date(created_at) created_at").group("date(created_at)").where("search_word = ? AND date(created_at) > date(curdate() - 7)", search_word)
  end
end
