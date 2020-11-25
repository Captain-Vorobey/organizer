class UsersController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def new
    @user = User.new
  end

  def create; end
end
