class MunicipiosController < ApplicationController

  autocomplete :departamento, :nombre, :full => true

  def index
        @nrp = (params[:registro] != nil)? params[:registro].to_i : 3


    if ((@nrp) <= 0)
     @nrp = 3
   end
    @municipios = Municipio.search(params[:search]).paginate(:per_page=>(@nrp), :page=>params[:page])

    respond_to do |format|
      format.html
      format.xml { render :xml => @municipios}
   end
 end

  def show
    @municipio = Municipio.find(params[:id])
  end

  def new
    @municipio = Municipio.new
  end

  def edit
    @municipio = Municipio.find(params[:id])
  end

  def create
    @municipio = Municipio.new(params[:municipio])
    @municipio.nombre = Municipio.municipio_lugar(@municipio)
    render :action => :new unless @municipio.save
    @municipios = Municipio.all
  end

  def update
    @municipio = Municipio.find(params[:id])
    render :action => :edit unless @municipio.update_attributes(params[:municipio])
  end

  def destroy
    @municipio = Municipio.find(params[:id])
    @municipio.destroy
    @municipios = Municipio.all
  end

end
