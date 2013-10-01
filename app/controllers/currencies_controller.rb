# -*- encoding : utf-8 -*-
class CurrenciesController < ApplicationController
  layout :get_layout

  before_filter :confirm_logged_in
  before_filter :confirm_priveleges_admin_or_manager

  def index
    @currencies = Currency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @currencies }
    end
  end

  def show
    @currency = Currency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @currency }
    end
  end

  def new
    @currency = Currency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @currency }
    end
  end

  def edit
    @currency = Currency.find(params[:id])
  end

  def create
    @currency = Currency.new(params[:currency])

    respond_to do |format|
      if @currency.save
        format.html { redirect_to @currency, notice: 'Currency was successfully created.' }
        format.json { render json: @currency, status: :created, location: @currency }
      else
        format.html { render action: "new" }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @currency = Currency.find(params[:id])

    respond_to do |format|
      if @currency.update_attributes(params[:currency])
        format.html { redirect_to @currency, notice: 'Currency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @currency = Currency.find(params[:id])
    @currency.destroy

    respond_to do |format|
      format.html { redirect_to currencies_url }
      format.json { head :no_content }
    end
  end
end
