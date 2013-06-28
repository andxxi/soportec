class LaboratoriesController < ApplicationController
  # GET /laboratories
  # GET /laboratories.json

  def index
    @laboratories = Laboratory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @laboratories }
    end
  end

  # GET /laboratories/1
  # GET /laboratories/1.json
  def show
    @laboratory = Laboratory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @laboratory }
    end
  end

  # GET /laboratories/new
  # GET /laboratories/new.json
  def new
    @laboratory = Laboratory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @laboratory }
    end
  end

  # GET /laboratories/1/edit
  def edit
    @laboratory = Laboratory.find(params[:id])
  end

  # POST /laboratories
  # POST /laboratories.json
  def create
    @laboratory = Laboratory.new(params[:laboratory])

    respond_to do |format|
      if @laboratory.save
        format.html { redirect_to @laboratory, notice: 'Laboratory was successfully created.' }
        format.json { render json: @laboratory, status: :created, location: @laboratory }
      else
        format.html { render action: "new" }
        format.json { render json: @laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /laboratories/1
  # PUT /laboratories/1.json
  def update
    @laboratory = Laboratory.find(params[:id])

    respond_to do |format|
      if @laboratory.update_attributes(params[:laboratory])
        format.html { redirect_to @laboratory, notice: 'Laboratory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratories/1
  # DELETE /laboratories/1.json
  def destroy
    @laboratory = Laboratory.find(params[:id])
    @laboratory.destroy

    respond_to do |format|
      format.html { redirect_to laboratories_url }
      format.json { head :no_content }
    end
  end

  def form
    @laboratory = Laboratory.find(params[:codigo_labo])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @laboratory }
    end
  end

end
