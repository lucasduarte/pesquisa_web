class Product < ActiveRecord::Base
  belongs_to :site
  validates :site, presence: true

  def Product.price_history search_word
    products = Product.select("min(price) price, date(created_at) created_at").group("date(created_at)").where("search_word = ? AND date(created_at) <= date(curdate())", search_word).order(:created_at => 'desc').take(7)
  end

  def Product.last_searched
   searches =  Search.all.order(:updated_at => 'desc').limit(3)

   products = []
   searches.each do |s|
    products << Product.where("search_word = ? and status = 1", s.search_word).order(:price => 'asc').first
   end

   products
  end
end
