module ProductsHelper
  def display_price(price)
    if session[:admin]
      return price / 100
    else
      return (price / 100) * 2
    end
  end
end
