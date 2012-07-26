class Admin::PublishersController < ApplicationController
  # GET /admin/publishers
  # GET /admin/publishers.json
  def index
    @publishers = Publisher.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publishers }
    end
  end

  # GET /admin/publishers/1
  # GET /admin/publishers/1.json
  def show
    @publisher = Publisher.find(params[:id])
    @page_title = @publisher.name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @publisher }
    end
  end

  # GET /admin/publishers/new
  # GET /admin/publishers/new.json
  def new
    @publisher = Publisher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @publisher }
    end
  end

  # GET /admin/publishers/1/edit
  def edit
    @publisher = Publisher.find(params[:id])
  end

  # POST /admin/publishers
  # POST /admin/publishers.json
  def create
    @publisher = Publisher.new(params[:publisher])

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to @publisher, notice: 'Publisher was successfully created.' }
        format.json { render json: @publisher, status: :created, location: @publisher }
      else
        format.html { render action: "new" }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/publishers/1
  # PUT /admin/publishers/1.json
  def update
    @publisher = Publisher.find(params[:id])

    respond_to do |format|
      if @publisher.update_attributes(params[:publisher])
        format.html { redirect_to @publisher, notice: 'Publisher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/publishers/1
  # DELETE /admin/publishers/1.json
  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy

    respond_to do |format|
      format.html { redirect_to publishers_url }
      format.json { head :no_content }
    end
  end
end
