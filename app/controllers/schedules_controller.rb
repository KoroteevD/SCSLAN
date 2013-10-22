class SchedulesController < ApplicationController

  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  def index
    if params[:type] == '1' || params[:type] == '2'
      @schedules = Schedule.where(sch_type: params[:type])
      @subtitle = 'студентов' if params[:type] == '1'
      @subtitle = 'преподавателей' if params[:type] == '2'
    else
      @subtitle = 'студентов и преподаватей'
      @schedules = Schedule.all
    end
  end

  # GET /schedules/1
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  def create

    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      redirect_to schedules_path
    else
      render action: 'new'
    end

  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    @schedule.update(schedule_params)
    render text: " "
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    redirect_to schedules_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:name, :body, :sch_type)
    end
end
