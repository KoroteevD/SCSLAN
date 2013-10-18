class Lecturer < ActiveRecord::Base
	mount_uploader :photo, PostsUploader
	

	validates :degree, :presence => true
	validates :direction, :presence => true
	validates :name, :presence => true
	validates :position, :presence => true
	validates :photo, :presence => true

	has_many :subjects

end
