module ProductsHelper
  def display_price(price)
    if session[:admin]
      return price
    else
      return price * 2
    end
  end
end
