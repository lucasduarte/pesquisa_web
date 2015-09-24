class SearchesController < ApplicationController

  def show
    @search_word = params[:search_word]
    search = Search.find_by(search_word: @search_word)

    @results = nil

    if(search.nil?)
      @results = Search.search_products @search_word
    else
      @results = Product.where(search_word: @search_word, status: true).order(price: :asc).includes(:site)
    end
    
    @results
  end

  def add_alert
    user_id = current_user.id
    search_word = params[:search_word]
    price = params[:price]
    category = params[:category]

    alert = Alert.create_alert user_id, search_word, category, price

    redirect_to user_profile_path
  end
end
