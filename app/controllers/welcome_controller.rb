class WelcomeController < ApplicationController
  def index
    @most_searched = Search.all.order(:count => 'desc').limit(3)

    @last_searched = Product.last_searched
    
  end
end
