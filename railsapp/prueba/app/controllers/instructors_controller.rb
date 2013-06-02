class InstructorsController < ApplicationController

  def index
    @instructors = Instructor.search(params[:search]).page(params[:page]).per_page(5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml {render :xml => @instructor}
      #format.json { render json: @instructors }
    end
  end

 
  def show
    @instructor = Instructor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @instructor }
    end
  end


  def new
    @instructor = Instructor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @instructor }
    end
  end


  def edit
    @instructor = Instructor.find(params[:id])
  end

 
  def create
    @instructor = Instructor.new(params[:instructor])

    respond_to do |format|
      if @instructor.save
        format.html { redirect_to @instructor, notice: 'Instructor was successfully created.' }
        format.json { render json: @instructor, status: :created, location: @instructor }
      else
        format.html { render action: "new" }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    @instructor = Instructor.find(params[:id])

    respond_to do |format|
      if @instructor.update_attributes(params[:instructor])
        format.html { redirect_to @instructor, notice: 'Instructor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy

    respond_to do |format|
      format.html { redirect_to instructors_url }
      format.json { head :no_content }
    end
  end
end
