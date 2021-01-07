module Orderable
  extend ActiveSupport::Concern

  def get_length
    length = set_time_limit.length
    length * 60
  end

  def get_begin_time
    time_limit = set_time_limit
    @time = time_limit
    result = []

    st = time_limit.start_time.to_datetime.to_i
    en = time_limit.end_time.to_datetime.to_i

    st_hour = time_limit.start_time.to_a
    en_hour = time_limit.end_time.to_a

    length = get_length
    (st..en).step(length) do |el|
      result.push(Time.at(el).utc) if st_hour[2] <= Time.at(el).utc.hour && en_hour[2] >= Time.at(el).utc.hour
    end
    result
  end

  def start_time_validate(order)
    orders = @order.service.orders

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
