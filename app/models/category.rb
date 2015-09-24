class Category < ActiveRecord::Base
  has_many :site 

  def name
    self.description
  end
end
