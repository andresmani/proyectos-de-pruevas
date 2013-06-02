class PersonasController < ApplicationController
 
  autocomplete :municipio, :nombre, :full  => true

  def index
    @personas = Persona.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personas }
    end
  end

 
  def show
    @persona = Persona.find(params[:id])
  end

  def new
    @persona = Persona.new
  end

  def edit
    @persona = Persona.find(params[:id])
  end

  def create
    @persona = Persona.new(params[:persona])
    render :action => :new unless @persona.save
  end

  def update
    @persona = Persona.find(params[:id])
    render :action => :edit unless @persona.update_attributes(params[:persona])
  end

  
  def destroy
    @persona = Persona.find(params[:id])
    @persona.destroy
  end
end
