class PaisesController < ApplicationController

  def index
   @nrp = (params[:registro] != nil)? params[:registro].to_i : 3

   if ((@nrp) <= 0)
    @nrp = 3
  end
   @paises = Pais.search(params[:search]).paginate(:per_page=>(@nrp), :page=>params[:page])

   respond_to do |format|
     format.html
      format.xml { render :xml => @paises }
   end
 end


  def show
      @pais = Pais.find(params[:id])
  end

  def new
      @pais = Pais.new
  end

  def edit
      @pais = Pais.find(params[:id])
  end

  def create
      @pais = Pais.new(params[:pais])
      render :action => :new unless @pais.save
      @paises = Pais.all
  end

  def update
      @pais = Pais.find(params[:id])
      render :action => :edit unless @pais.update_attributes(params[:pais])
  end

  def destroy
      @pais = Pais.find(params[:id])
      @pais.destroy
      @paises =Pais.all
  end
  
end