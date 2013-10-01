# -*- encoding : utf-8 -*-
class ChmailsController < ApplicationController

  layout 'admin'

  before_filter :confirm_logged_in
  before_filter :confirm_priveleges_admin

  def index
    @chmails = Chmail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chmails }
    end
  end

  def show
    @chmail = Chmail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chmail }
    end
  end

  def new
    @chmail = Chmail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chmail }
    end
  end

  def edit
    @chmail = Chmail.find(params[:id])
  end

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

  def destroy
    @chmail = Chmail.find(params[:id])
    @chmail.destroy

    respond_to do |format|
      format.html { redirect_to chmails_url }
      format.json { head :no_content }
    end
  end
end
