class MessagesController < ApplicationController
  # $('#message_body').val('');
  def create
    @company = Company.find(params[:company_id])
    allowed_params = message_params.merge(company: @company, user: current_user)
    message = Message.create(allowed_params)
    redirect_to company_path(@company)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
