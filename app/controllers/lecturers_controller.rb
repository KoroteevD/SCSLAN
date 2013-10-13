class LecturersController < ApplicationController

  before_filter :find_lecturer, only: [:show,:edit,:update,:destroy]
  before_filter :authenticate_user!, :only=>[:new,:create,:edit,:update,:destroy]

  # GET /lecturers
  def index
    @lecturers = Lecturer.all
  end

  # GET /lecturers/1
  def show
  end

  # GET /lecturers/new
  def new
    @lecturer = Lecturer.new
  end

  # GET /lecturers/1/edit
  def edit
  end

  # POST /lecturers
  def create
    @lecturer = Lecturer.new(lecturer_params)
    if @lecturer.save
      redirect_to @lecturer
    else
      render action: "new"
    end
  end


  # PUT /lecturers/1
  def update
    if @lecturer.update_attributes(lecturer_params)
        redirect_to @lecturer, notice: 'Lecturer was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /lecturers/1
  def destroy
    @lecturer.destroy
    redirect_to lecturers_path
  end

  private

    def find_lecturer
       @lecturer = Lecturer.find(params[:id])
       render_404 unless @lecturer
    end
    # Метод в стиле RoR4, убирающий из параметров запроса 
    # все поля, которые не указаны в аргументах permit
    def lecturer_params
      params.require(:lecturer).permit(:degree,:direction,:name,:position,:photo)
    end

end
