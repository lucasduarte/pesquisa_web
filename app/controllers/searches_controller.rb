class SearchesController < ApplicationController

  def show
    @search_word = params[:search_word].downcase
    search = Search.find_by(search_word: @search_word)

    @results = nil

    if(search.nil?)
      @results = Search.search_products @search_word
    else
      search.count += 1;
      search.save
      @results = Product.where(search_word: @search_word, status: true).order(price: :asc).includes(:site)
    end

    @price_history = Product.price_history @search_word

    dates = []
    prices = []

    @price_history.reverse.each do |p|
      dates <<  l(p.created_at, format: '%d %b')
      prices << p.price
    end

    @chart = LazyHighCharts::HighChart.new('area') do |f|
      f.title(:text => "Histórico de Preço (R$)")
      f.xAxis(:categories => dates)
      f.series(:name => "Preço", :yAxis => 0, :data => prices)
      f.chart({:defaultSeriesType=>"area"})
    end

  end

  def add_alert
    user_id = current_user.id
    search_word = params[:search_word].downcase
    price = params[:price]
    category = params[:category]

    alert = Alert.create_alert user_id, search_word, category, price
    flash[:success] = "Alerta salvo com sucesso!"
    redirect_to user_profile_path
  end
end
