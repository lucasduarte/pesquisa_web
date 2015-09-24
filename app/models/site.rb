class Site < ActiveRecord::Base
  belongs_to :category
  has_many :product
  validates :category, presence: true
  ratyrate_rateable "id"

  

end
