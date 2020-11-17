class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile; end

  def about
  end

  def new
    @user = User.new
  end

  def create; end
end
