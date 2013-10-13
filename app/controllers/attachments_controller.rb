class AttachmentsController < ApplicationController

	before_filter	:find_attachment, :only=>[:destroy]


	def destroy
		@att.destroy
		redirect_to edit_post_path (params[:post_id])
	end

	def find_attachment
		@att = Attachment.where("post_id=? and id=?", params[:post_id], params[:id]).first
	end

end
