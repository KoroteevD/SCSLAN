class Lecturer < ActiveRecord::Base
	mount_uploader :photo, PostsUploader
	

	validates :degree, :presence => true
	validates :degree_ukr, :presence => true
	validates :direction, :presence => true
	validates :direction_ukr, :presence => true
	validates :name, :presence => true
	validates :name_ukr, :presence => true
	validates :position, :presence => true
	validates :position_ukr, :presence => true
	validates :photo, :presence => true

	has_many :subjects

end
