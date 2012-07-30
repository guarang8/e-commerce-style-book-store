module ApplicationHelper
	def add_book_link(text, book)
		link_to text,  cart_add_path(:id => book.id),
					   { :title => "Add to cart", 
					   	 :href => cart_add_path(:id => book.id)
					   }, :remote => true
	end

	def remove_book_link(text,book)
		link_to text, cart_remove_path(:id => book.id),
					   { :title => "Remove book", 
					   	 :href => cart_remove_path(:id => book.id)
					   }, :remote => true
	end

	def clear_cart_link(text= "Clear Cart")
		link_to text, { :url => cart_clear_path},
					   { :href => cart_clear_path }, :remote => true
	end
end
