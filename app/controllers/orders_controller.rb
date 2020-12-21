class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_time_limit, only: %i[create destroy]
  before_action :set_service, :set_order, only: [:show]

  def index
    @orders = current_user.orders.all
  end

  def show
  end

  def new
    @beginArray = get_begin_time
    @duration = get_length
  end

  def edit; end

  def create
    allowed_params = order_params

    @order = Order.new(allowed_params)
    @order.user_id = current_user.id
    @order.service = @service

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, location: @order }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to order_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_length
    length = set_time_limit.length.to_a
    min = length[1]
    hour = length[2] * 60
    (hour + min) * 60
  end

  def get_begin_time
    time_limit = set_time_limit
    @time = time_limit
    array = []
    st = time_limit.start_time.to_datetime.to_i
    en = time_limit.end_time.to_datetime.to_i

    sttt = time_limit.start_time.to_datetime.hour
    ennn = time_limit.end_time.to_datetime.hour

    st_hour = time_limit.start_time.to_a
    en_hour = time_limit.end_time.to_a

    length = get_length
    (st..en).step(length) do |el|
      if st_hour[2] <= Time.at(el).utc.hour && en_hour[2] >= Time.at(el).utc.hour
        array.push(Time.at(el).utc)
      end
    end
      array
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_service
    @service ||= Service.find(@order.service_id)
  end

  def set_time_limit
    p params
    @time_limit = TimeLimit.find(Service.find(params[:service_id]).time_limit_id)
  end

  def order_params
    params.permit(:name, :start_time, :end_time, :user_id, :service_id)
  end
end
