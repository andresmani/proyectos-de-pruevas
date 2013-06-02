class PersonasController < ApplicationController

 autocomplete :municipio, :nombre, :full => true

  def index
   @nrp = (params[:registro] != nil)? params[:registro].to_i : 3

   if ((@nrp) <= 0)
    @nrp = 3
  end
   @personas = Persona.search(params[:search]).paginate(:per_page=>(@nrp), :page=>params[:page])

   respond_to do |format|
     format.html
      format.xml { render :xml => @personas }
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
      @personas =Persona.all
  end

  def update
      @persona = Persona.find(params[:id])
      render :action => :edit unless @persona.update_attributes(params[:persona])
  end

  def destroy
      @persona = Persona.find(params[:id])
      @persona.destroy
      @personas = Persona.all
  end
  
end