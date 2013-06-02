class CartelerasController < ApplicationController
  # GET /carteleras
  # GET /carteleras.json
  def index
    @carteleras = Cartelera.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carteleras }
    end
  end

  # GET /carteleras/1
  # GET /carteleras/1.json
  def show
    @cartelera = Cartelera.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cartelera }
    end
  end

  # GET /carteleras/new
  # GET /carteleras/new.json
  def new
    @cartelera = Cartelera.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cartelera }
    end
  end

  # GET /carteleras/1/edit
  def edit
    @cartelera = Cartelera.find(params[:id])
  end

  # POST /carteleras
  # POST /carteleras.json
  def create
    @cartelera = Cartelera.new(params[:cartelera])

    respond_to do |format|
      if @cartelera.save
        format.html { redirect_to @cartelera, notice: 'Cartelera was successfully created.' }
        format.json { render json: @cartelera, status: :created, location: @cartelera }
      else
        format.html { render action: "new" }
        format.json { render json: @cartelera.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carteleras/1
  # PUT /carteleras/1.json
  def update
    @cartelera = Cartelera.find(params[:id])

    respond_to do |format|
      if @cartelera.update_attributes(params[:cartelera])
        format.html { redirect_to @cartelera, notice: 'Cartelera was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cartelera.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carteleras/1
  # DELETE /carteleras/1.json
  def destroy
    @cartelera = Cartelera.find(params[:id])
    @cartelera.destroy

    respond_to do |format|
      format.html { redirect_to carteleras_url }
      format.json { head :no_content }
    end
  end
end
