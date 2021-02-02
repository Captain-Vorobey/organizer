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
    
    st_hour = time_limit.start_time.to_a
    en_hour = time_limit.end_time.to_a

    length = get_length
    (st..en).step(length) do |el|
      result.push(Time.at(el).utc) if st_hour[2] <= Time.at(el).utc.hour && en_hour[2] >= Time.at(el).utc.hour
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

  def reminder(length, interval, order)
    length = convert(length, interval)
    wait_till_date = order.start_time.to_time - length * 60
    OrderMailer.order_email(current_user).deliver_later(wait_until: wait_till_date)
  end

  def convert(length, interval)
    length ||= 60
    interval ||= 'minutes'

    if interval == 'minutes'
      length
    elsif interval == 'hours'
      length * 60
    elsif interval == 'days'
      (length * 24) * 60
    end
  end

  def service
    @service = Service.find(params[:id])
  end
end
