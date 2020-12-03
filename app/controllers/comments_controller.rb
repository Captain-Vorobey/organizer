class CommentsController < ApplicationController
  def create
	allowed_params = comment_params.merge(service: set_service, user: current_user)
	comment = Comment.create(allowed_params)
    redirect_to service_path(set_service)
  end

  def destroy
	service = set_service
    comment = service.comments.find(params[:id])
    comment.destroy
    redirect_to service_path(set_service)
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end

  def set_service
	service = Service.find(params[:service_id])
  end
end
