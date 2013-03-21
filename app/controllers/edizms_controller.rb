# -*- encoding : utf-8 -*-
class EdizmsController < ApplicationController

  layout 'manager'

  before_filter :confirm_logged_in
  before_filter :confirm_priveleges_manager
  
  def index
    @edizms = Edizm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @edizms }
    end
  end

  # GET /edizms/1
  # GET /edizms/1.json
  def show
    @edizm = Edizm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @edizm }
    end
  end

  # GET /edizms/new
  # GET /edizms/new.json
  def new
    @edizm = Edizm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @edizm }
    end
  end

  # GET /edizms/1/edit
  def edit
    @edizm = Edizm.find(params[:id])
  end

  # POST /edizms
  # POST /edizms.json
  def create
    @edizm = Edizm.new(params[:edizm])

    respond_to do |format|
      if @edizm.save
        format.html { redirect_to @edizm, notice: 'Edizm was successfully created.' }
        format.json { render json: @edizm, status: :created, location: @edizm }
      else
        format.html { render action: "new" }
        format.json { render json: @edizm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /edizms/1
  # PUT /edizms/1.json
  def update
    @edizm = Edizm.find(params[:id])

    respond_to do |format|
      if @edizm.update_attributes(params[:edizm])
        format.html { redirect_to @edizm, notice: 'Edizm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @edizm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edizms/1
  # DELETE /edizms/1.json
  def destroy
    @edizm = Edizm.find(params[:id])
    @edizm.destroy

    respond_to do |format|
      format.html { redirect_to edizms_url }
      format.json { head :no_content }
    end
  end
end
