class CreateManuals < ActiveRecord::Migration
  def change
    create_table :manuals do |t|
      t.string 		:name
      t.references 	:subject
      t.string 		:file
      t.timestamps
    end
  end
end
