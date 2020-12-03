class CommentsController < ApplicationController
  def create
	service = Service.find(params[:service_id])
	allowed_params = comment_params.merge(service: service, user: current_user)
	comment = Comment.create(allowed_params)
    redirect_to service_path(service)
  end

  def destroy
    service = Service.find(params[:service_id])
    comment = service.comments.find(params[:id])
    comment.destroy
    redirect_to service_path(service)
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end
end
