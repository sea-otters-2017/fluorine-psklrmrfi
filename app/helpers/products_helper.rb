module ProductsHelper
  def display_price(price)
    if user_is_admin?
      return price / 100
    else
      return (price / 100) * 2
    end
  end
end
