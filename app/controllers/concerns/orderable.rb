module Orderable
  extend ActiveSupport::Concern

  def get_length
    length = set_time_limit.length
    length * 60
  end

  def remove_duplicate_orders(result)
    orders = get_orders
    datetime_order = []
    orders.each do |el|
      datetime_order.push(el.start_time.to_datetime.to_i)
    end

    without_repeated_orders = []

    datetime_order.each do |el|
      without_repeated_orders.push(Time.at(el).utc)
    end
    result - without_repeated_orders
  end

  def get_begin_time
    time_limit = set_time_limit
    @time = time_limit
    result = []

    st = time_limit.start_time.to_datetime.to_i
    en = time_limit.end_time.to_datetime.to_i

    st_hour = time_limit.start_time.to_a
    en_hour = time_limit.end_time.to_a

    orders = get_orders

    length = get_length
    (st..en).step(length) do |el|
      result.push(Time.at(el).utc) if st_hour[2] <= Time.at(el).utc.hour && en_hour[2] >= Time.at(el).utc.hour
    end
    remove_duplicate_orders(result)
  end

  def get_orders
    @order.service.orders
  end

  def start_time_validate(order)
    orders = get_orders

    if orders.empty? == true
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
end
