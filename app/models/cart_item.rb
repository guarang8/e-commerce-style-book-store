class CartItem < ActiveRecord::Base
  attr_accessible :amount, :book_id, :cart_id, :price
  belongs_to :cart
  belongs_to :book
end
