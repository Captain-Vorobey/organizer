class CommentsController < ApplicationController
	def create
	  @service = Service.find(params[:service_id])
	  @comment = @service.comments.create(params[:comment].permit(:name, :comment))
	  p '!!!!!!!!!!!!!!!'
	  p @service.comments
	  p '!!!!!!!!!!!!!!!'
	  redirect_to service_path(@service)	
	end
  
	def destroy
	  @service = set_service
	  @comment = @service.comments.find(params[:id])
	  @comment.destroy
	  redirect_to service_path(@service)
  end
end