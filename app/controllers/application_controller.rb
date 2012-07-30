class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :initialize_cart
  def initialize_cart
  	if session[:cart_id]
  		@cart = Cart.find(session[:cart_id])
  	else
  		@cart = Cart.create!
  		session[:cart_id] = @cart.id
  	end
  end
end
