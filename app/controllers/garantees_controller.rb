class GaranteesController < ApplicationController
  layout 'admin'

  # GET /garantees
  # GET /garantees.json
  def index
    @garantees = Garantee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @garantees }
    end
  end

  # GET /garantees/1
  # GET /garantees/1.json
  def show
    @garantee = Garantee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @garantee }
    end
  end

  # GET /garantees/new
  # GET /garantees/new.json
  def new
    @garantee = Garantee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @garantee }
    end
  end

  # GET /garantees/1/edit
  def edit
    @garantee = Garantee.find(params[:id])
  end

  # POST /garantees
  # POST /garantees.json
  def create
    @garantee = Garantee.new(params[:garantee])

    respond_to do |format|
      if @garantee.save
        format.html { redirect_to @garantee, notice: 'Garantee was successfully created.' }
        format.json { render json: @garantee, status: :created, location: @garantee }
      else
        format.html { render action: "new" }
        format.json { render json: @garantee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /garantees/1
  # PUT /garantees/1.json
  def update
    @garantee = Garantee.find(params[:id])

    respond_to do |format|
      if @garantee.update_attributes(params[:garantee])
        format.html { redirect_to @garantee, notice: 'Garantee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @garantee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garantees/1
  # DELETE /garantees/1.json
  def destroy
    @garantee = Garantee.find(params[:id])
    @garantee.destroy

    respond_to do |format|
      format.html { redirect_to garantees_url }
      format.json { head :no_content }
    end
  end
end
