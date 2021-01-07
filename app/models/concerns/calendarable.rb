module Calendarable
  extend ActiveSupport::Concern

  def calendar_orders(_start)
    if recurring.empty?
      Order.new(id: id, title: title, start_at: TimeLimit.first.start_time, end_at: TimeLimit.first.end_time, color: news_orders_category.color, recurring: false, all_day: all_day)
    else
      schedule(start_time).occurrences(end_time).map do |date|
        Order.new(id: id, title: title, start_at: date, end_at: end_at, color: news_orders_category.color, recurring: recurring)
      end
    end
  end
end
