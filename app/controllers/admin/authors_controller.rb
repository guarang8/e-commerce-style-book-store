class Admin::AuthorsController < ApplicationController
  def new
    @author = Author.new
    @page_title = 'Create new author'
  end

  def create
    @author = Author.new(params[:author])
    if @author.save
      flash[:notice] = "Author #{@author.name} has been successfully created."
      redirect_to authors_path
    else
      @page_title = 'Create new author'
      render 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
    @page_title = 'Edit Author'
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      flash[:notice] = 'Author has been successfully updated.'
      redirect_to @author
    else
      @page_title = 'Edit author'
      render 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    flash[:notice] = "Successfully deleted author #{@author.name}"
    @author.destroy
    redirect_to authors_path
  end

  def show
    @author = Author.find(params[:id])
    @page_title = @author.name
  end

  def index
    @authors = Author.find(:all)
    @page_title = "Listing all the users"
  end
end
