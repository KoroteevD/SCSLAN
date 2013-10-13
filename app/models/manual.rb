class Manual < ActiveRecord::Base
	belongs_to :subject
	mount_uploader :file, FileUploader
end
