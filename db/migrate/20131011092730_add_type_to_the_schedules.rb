class AddTypeToTheSchedules < ActiveRecord::Migration
  def change
  	add_column :schedules, :sch_type, :integer
  end
end
