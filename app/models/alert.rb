class Alert < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true

  def Alert.send_mail product, user

    AlertMailer.price_alert(user, product).deliver_now
  end

  def Alert.check_prices
    alerts = Alert.where(:email_sent => false)

    alerts.each do |a|

      product = Product.where(:search_word => a.search_word, :status => true).order('price asc').first

      if(a.price > product.price)
        user = User.find(a.user_id)
        send_mail product, user
        a.email_sent = true
        a.save
      end 

    end
  end

  def Alert.remove_alerts
    alerts = Alert.where(:email_sent => true)

    Alert.transaction do 
      alerts.each(&:delete)
    end

  end

  def Alert.create_alert user_id, search_word, category, price
    alert = Alert.new


    alert.search_word = search_word
    alert.user_id = user_id
    alert.category = category
    alert.price = price.to_d
    alert.email_sent = false

    alert.save

    alert
  end
end
