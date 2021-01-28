module Duration
  extend ActiveSupport::Concern

  def get_length
    length = time_limit.length
    length * 60
  end

  def order_slots
    time = time_limit
    @time = time_limit
    result = []

    st = time.start_time.to_i
    en = time.end_time.to_i

    length = get_length
    (st..en).step(length) do |el|
      result.push(Time.at(el).utc)
    end

    result - service.orders.pluck(:start_time)
  end

  def get_orders
    @order.service.orders
  end

  def start_time_validate(order)
    orders = get_orders

    if orders.empty?
      order
    else
      res = 0
      orders.each do |el|
        if order.start_time == el.start_time
          order.start_time = nil
          res = order
        else
          res = order
        end
      end
      res
    end
  end

  def reminder(length, order)
    # p '+++++++++++'
    # p arr = order.start_time.to_a
    # p '----------------------'
    # p hourrr = arr[2] - length
    # p arr[2] = hourrr
    # p '+++++++++++'
    # p order.start_time.to_datetime.hour - length
 
    # p 'time at time at time at'
    # p Time.at(order.start_time.to_datetime.hour - length).utc
    # p 'time at time at time at'

    OrderMailer.order_email(current_user).deliver_later(wait_until: order.start_time)
  end

  def valid_time(length)
    
  end

  def service
    @service = Service.find(params[:id])
  end
end
