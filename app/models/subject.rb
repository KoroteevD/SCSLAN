class Subject < ActiveRecord::Base


  validates :title, :presence => true
  validates :description, :presence => true
  validates :lecturer_id, :presence => true
  validates :course, :presence => true

  belongs_to :lecturer

  has_many :manuals

end
