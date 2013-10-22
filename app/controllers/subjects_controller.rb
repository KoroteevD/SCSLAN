 # coding: utf-8

class SubjectsController < ApplicationController

  before_filter :title_set

  before_filter :find_subject, only: [:show,:edit,:update,:destroy]

  def index
  end

  def list
    @subjects = Subject.all.order ('title')
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to @subject
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @subject.update_attributes(subject_params)
       redirect_to @subject, notice: 'Lecturer was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @subject.destroy
    redirect_to subjects_path
  end

  def find_subject
    @subject = Subject.where(id:params[:id]).first
    render_404 unless @subject
  end

  def title_set
    @title = "Предметы"
  end

  private
    # Метод в стиле RoR4, убирающий из параметров запроса 
    # все поля, которые не указаны в аргументах permit
    def subject_params
      params.require(:subject).permit(:title,:description,:lecturer_id,:course)
    end

end
