class Admin::BooksController < ApplicationController
  # GET /admin/books
  # GET /admin/books.json
  def index
    list
  end

  def list
    @page_title = 'Listing books'
    sort_by = params[:sort_by]
    @books = Book.all(:order => sort_by)
  end

  # GET /admin/books/1
  # GET /admin/books/1.json
  def show
    @book = Book.find(params[:id])
    @page_title = "#{@book.title}"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /admin/books/new
  # GET /admin/books/new.json
  def new
    load_data
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /admin/books/1/edit
  def edit
    @page_title = 'Editing book'
    load_data
    @book = Book.find(params[:id])
  end

  # POST /admin/books
  # POST /admin/books.json
  def create
    @book = Book.new(params[:book])

    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to books_path
    else
      load_data
      render 'new'
    end
  end

  # PUT /admin/books/1
  # PUT /admin/books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/books/1
  # DELETE /admin/books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end
  private
  def load_data
    @authors = Author.find(:all)
    @publishers = Publisher.find(:all)
  end
end
