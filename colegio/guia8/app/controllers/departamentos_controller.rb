class DepartamentosController < ApplicationController
   #codigo del auto complete
    autocomplete :pais, :nombre, :full => true

  def index 
   @nrp = (params[:registro] != nil)? params[:registro].to_i : 3 # seleccionar el numero de registros

    if ((@nrp) <= 0)
       @nrp = 3
    end
    @departamentos = Departamento.search(params[:search]).paginate(:per_page=>(@nrp), :page=>params[:page])
    respond_to do |format|
    format.html
    format.xml { render :xml => @departamentos }
    end
  end

  def show
      @departamento = Departamento.find(params[:id])
  end

  def new
      @departamento = Departamento.new
  end

  def edit
      @departamento = Departamento.find(params[:id])
  end

  def create
      @departamento = Departamento.new(params[:departamento])
      render :action => :new unless @departamento.save
      @departamentos = Departamento.all
  end

  def update
      @departamento = Departamento.find(params[:id])
      render :action => :edit unless @departamento.update_attributes(params[:departamento])
  end

  def destroy
      @departamento = Departamento.find(params[:id])
      @departamento.destroy
      @departamentos = Departamento.all
  end
  
end