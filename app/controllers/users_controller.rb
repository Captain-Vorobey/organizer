class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[update]

  def show
    @user = User.find(params[:id])
    p 'qqqqqqqqqqqqqq'
    p @user.role_ids
    p 'qqqqqqqqqqqqqq'
    @address = @user.address
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Your account was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_address
    @address = Address.new(address_params)
    @address.addressable_type = 'User'
    @address.addressable_id = current_user.id
    @address.save
    @address
  end

  def create_address
    @address = Address.new
  end

  def new
    @user = User.new(user_params)
    @user.add_role params[:role_ids]
  end

  def create; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def user_params
    # params.require(:user).permit(:name, :surname, :address_id, input_roles: [])
    params.require(:user).permit(:name, :surname, :address_id, :email, :password, :password_confirmation)
  end
end
