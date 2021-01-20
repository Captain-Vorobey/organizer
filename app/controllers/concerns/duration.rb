module Duration
  extend ActiveSupport::Concern

  def get_length
    length = time_limit.length
    length * 60
  end

  def snakecase(service)
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
end
