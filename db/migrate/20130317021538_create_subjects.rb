class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
    	t.string		:title
    	t.text			:description
    	t.integer       :lecturer_id
    	t.integer		:course
    	t.timestamps
    end
  end
end
