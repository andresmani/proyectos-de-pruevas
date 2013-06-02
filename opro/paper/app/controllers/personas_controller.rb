class PersonasController < ApplicationController
 
  def index
    @personas = Persona.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personas }
    end
  end


  def show
    @persona = Persona.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @persona }
    end
  end

  
  def new
    @persona = Persona.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @persona }
    end
  end


  def edit
    @persona = Persona.find(params[:id])
  end

  def create
    @persona = Persona.new(params[:persona])

    respond_to do |format|
      if @persona.save
        format.html { redirect_to @persona, notice: 'Persona was successfully created.' }
        format.json { render json: @persona, status: :created, location: @persona }
      else
        format.html { render action: "new" }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    @persona = Persona.find(params[:id])

    respond_to do |format|
      if @persona.update_attributes(params[:persona])
        format.html { redirect_to @persona, notice: 'Persona was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @persona = Persona.find(params[:id])
    @persona.destroy

    respond_to do |format|
      format.html { redirect_to personas_url }
      format.json { head :no_content }
    end
  end
end
