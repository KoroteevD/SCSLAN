# coding: utf-8

class ManualsController < ApplicationController

  before_action :set_subject, only: [:index,:new,:create]
  before_action :set_manual, only: [:show, :edit, :update, :destroy]

  # GET /manuals
  def index
    @manuals = @subject.manuals
  end

  # GET /manuals/new
  def new
    @manual = Manual.new
  end

  # POST /manuals
  def create
    @manual = Manual.new(manual_params)
    @manual.subject = @subject
    if @manual.save
      redirect_to subject_manuals_path(@subject.id), notice: 'Методический материал был успешно добавлен.'
    else
      render action: 'new'
    end
  end


  # DELETE /manuals/1
  def destroy
    @manual.destroy
    redirect_to subject_manuals_path(@service)
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_subject
      @subject = Subject.find params[:subject_id]
    end

    def set_manual
      set_subject
      @manual = @subject.manuals.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manual_params
      params.require(:manual).permit(:name, :name_ukr, :subject, :file)
    end
end
