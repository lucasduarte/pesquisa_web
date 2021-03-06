module ApplicationHelper
  def gravatar_for(user,style)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: style)
  end 

  def currency_format(number)
    number_to_currency number,
    unit: "R$",
    separator: ".",
    delimiter: ","
  end
end
