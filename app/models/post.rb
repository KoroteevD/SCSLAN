class Post < ActiveRecord::Base

  before_destroy do |post|
  	#post.photos.each { |att| att.destroy }
  	Attachment.destroy_all("post_id=#{post.id}")
  end

  mount_uploader :photo, PostsUploader

  validates :title, :presence => true
  validates :text, :presence => true

  has_many :attachments


end
