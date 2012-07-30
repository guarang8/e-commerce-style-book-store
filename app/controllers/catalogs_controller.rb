class CatalogsController < ApplicationController
  before_filter :initialize_cart
  def index
  	@page_title = "Book List"
  	@books = Book.search(params)
  end

  def show
  	@book = Book.find(params[:id])
  end

  def search
  end

  def latest
  	@page_title = "Latest Books"
  	@books = Book.latest
  end

  def feed
  	@books = Book.latest
  	@updated = @books.first.updated_at unless @books.empty?
  	respond_to do |format|
  		format.atom{ render layout: false }
  		format.rss{ redirect_to feed_path(format: :atom), status: :moved_permanently }
  	end
  end
end
