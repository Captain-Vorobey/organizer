module Orderable
  extend ActiveSupport::Concern

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
      array.push(Time.at(el).utc) if st_hour[2] <= Time.at(el).utc.hour && en_hour[2] >= Time.at(el).utc.hour
    end
    array
  end
end
