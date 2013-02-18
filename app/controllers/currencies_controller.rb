class CurrenciesController < ApplicationController
  layout 'admin'
  
  before_filter :confirm_logged_in
  before_filter :confirm_priveleges_admin
  
  def index
    @currencies = Currency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @currencies }
    end
  end

  # GET /currencies/1
  # GET /currencies/1.json
  def show
    @currency = Currency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @currency }
    end
  end

  # GET /currencies/new
  # GET /currencies/new.json
  def new
    @currency = Currency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @currency }
    end
  end

  # GET /currencies/1/edit
  def edit
    @currency = Currency.find(params[:id])
  end

  # POST /currencies
  # POST /currencies.json
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

  # PUT /currencies/1
  # PUT /currencies/1.json
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

  # DELETE /currencies/1
  # DELETE /currencies/1.json
  def destroy
    @currency = Currency.find(params[:id])
    @currency.destroy

    respond_to do |format|
      format.html { redirect_to currencies_url }
      format.json { head :no_content }
    end
  end
end
