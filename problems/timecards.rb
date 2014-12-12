# [In,Out]
punch_cards = [
  [1,5],
  [2,7],
  [1,24],
  [3,9],
  [2,10],
  [3,7],
  [2,11],
  [1,9]
]

CLOCK_IN_INDEX = 0
CLOCK_OUT_INDEX = 1

hourly_employee_count = {}

punch_cards.each do |punch_card|
  clock_in = punch_card[CLOCK_IN_INDEX]
  clock_out = punch_card[CLOCK_OUT_INDEX]

  (clock_in..clock_out).to_a.each do |hour|
    if hourly_employee_count[hour]
      hourly_employee_count[hour] += 1
    else
      hourly_employee_count[hour] = 1
    end
  end
end

hourly_employee_count.each do |hour|
  puts "#{hour.first}:00: #{hour.last} employee(s)"
end
