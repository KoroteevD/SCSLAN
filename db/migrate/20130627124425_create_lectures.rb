class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :name
      t.string :position
      t.string :degree
      t.string :direction
      t.string :photo
      t.timestamps
    end
  end
end
