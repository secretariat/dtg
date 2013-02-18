# -*- encoding : utf-8 -*-
class ChmailsController < ApplicationController
  layout 'admin'
  before_filter :confirm_logged_in
  
  def index
    @chmails = Chmail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chmails }
    end
  end

  # GET /chmails/1
  # GET /chmails/1.json
  def show
    @chmail = Chmail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chmail }
    end
  end

  # GET /chmails/new
  # GET /chmails/new.json
  def new
    @chmail = Chmail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chmail }
    end
  end

  # GET /chmails/1/edit
  def edit
    @chmail = Chmail.find(params[:id])
  end

  # POST /chmails
  # POST /chmails.json
  def create
    @chmail = Chmail.new(params[:chmail])

    respond_to do |format|
      if @chmail.save
        format.html { redirect_to @chmail, notice: 'Chmail was successfully created.' }
        format.json { render json: @chmail, status: :created, location: @chmail }
      else
        format.html { render action: "new" }
        format.json { render json: @chmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chmails/1
  # PUT /chmails/1.json
  def update
    @chmail = Chmail.find(params[:id])

    respond_to do |format|
      if @chmail.update_attributes(params[:chmail])
        format.html { redirect_to @chmail, notice: 'Chmail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chmails/1
  # DELETE /chmails/1.json
  def destroy
    @chmail = Chmail.find(params[:id])
    @chmail.destroy

    respond_to do |format|
      format.html { redirect_to chmails_url }
      format.json { head :no_content }
    end
  end
end
