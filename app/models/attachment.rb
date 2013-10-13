class Attachment < ActiveRecord::Base

  mount_uploader :photo, PostsUploader

  belongs_to :post

  validates :post_id, :presence => true
end
