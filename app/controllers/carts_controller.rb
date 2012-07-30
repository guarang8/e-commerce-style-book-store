class CartsController < ApplicationController
  before_filter :initialize_cart

  def add
  	#params[:id].gsub!(/book_/, "")
  	@book = Book.find(params[:id])
  	if request.xhr?
  		@item = @cart.add(params[:id])
  		flash.now[:cart_notice] = "Added <em>#{@item.book.title}</em>"
  		render "add_with_ajax"
  	elsif request.post?
  		@item = @cart.add(params[:id])
  		flash[:cart_notice] = "Added <em>#{@item.book.title}</em>"
  		redirect_to session[:return_to] || catalogs_path
  	else
  		render
  	end
  end

  def remove
  	@book = Book.find(params[:id])
  	if request.xhr?
  		@item = @cart.remove(params[:id])
  		flash.now[:cart_notice] = "Removed 1 <em>#{@item.book.title}</em>"
  		render "remove_with_ajax"
  	elsif request.post?
  		@item = @cart.remove(params[:id])
  		flash[:cart_notice] = "Removed 1 <em>#{@item.book.title}</em>"
  		redirect_to catalogs_path
  	else
  		render
  	end
  end

  def clear
  	if request.xhr?
  		@cart.cart_items.destroy_all
  		flash.now[:cart_notice] = "Cleared thr cart"
  		render "clear_with_ajax"
  	elsif request.post?
  		@cart.cart_items.destroy_all
  		flash[:cart_notice] = "Cleared the cart"
  		redirect_to catalogs_path
  	else
  		render
  	end
  end
end
