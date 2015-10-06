class AlertMailer < ApplicationMailer
  def price_alert(user, product)
    @product = product
    mail to: user.email, subject: "Alerta de Preço Atingido!"
  end

end
