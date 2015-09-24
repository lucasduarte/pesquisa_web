class AlertsController < ApplicationController

  def add_alert
    user_id = params[:user_id]
    search_word = params[:search_word]
    price = params[:price]
    category = params[:category]

    alert = Alert.create_alert user_id, search_word, category, price

    render json: alert
  end

  def remove_alert
    alert_id = params[:id]
    render json: Alert.destroy(alert_id)
  end

  def get_alert
    alert_id = params[:id]
    render json: Alert.find(alert_id)
  end

  def get_alerts
    user_id = params[:user_id]
    alerts = Alert.where(:user_id => user_id)
    results = []

    alerts.each do |a|
      search_word = Search.find(a.search_id)
      result = {}
      result[:search_word] = search_word.search_word
      result[:price] = a.price
      result[:id] = a.id


      results << result
    end

    render json: results
  end
end
