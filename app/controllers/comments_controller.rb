class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    allowed_params = comment_params.merge(commentable: @commentable, user: current_user)
    comment = Comment.create(allowed_params)

    respond_to do |format|
      format.html { redirect_to company_path(company) }
      format.js { render layout: false }
    end
  end

  def destroy
    service = service
    comment = service.comments.find(params[:id])
    comment.destroy
    redirect_to company_path(service)
  end

  private

  def set_commentable
    @commentable = Company.find(params[:company_id]) unless params[:company_id].nil?
    @commentable
  end

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end

  def company
    service = Company.find(params[:company_id])
  end
end
