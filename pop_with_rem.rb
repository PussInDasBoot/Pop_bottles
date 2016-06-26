# pop_bottles.rb
begin
  puts "How much would you like to spend?"
  cash = gets.chomp
  bottles = cash.gsub(/[^0-9]/,'').to_i / 2
  remaining_bottles = 0
  bottles_from_bottles = 0

  while bottles >= 2
    bottles_returned = bottles / 2
    remaining_bottles += bottles_returned % 2
    if remaining_bottles == 2
      bottles_from_bottles += 1
      remaining_bottles = 0
    end
    bottles = bottles_returned
    bottles_from_bottles += bottles_returned
  end

  initial_bottles = (cash.gsub(/[^0-9]/,'').to_i / 2)

  puts "#{cash} will buy you #{initial_bottles} bottles. 
  If you recycle the bottles you will get #{bottles_from_bottles} bottles back with #{remaining_bottles} left over"

  bottles_from_caps = 0

  number_of_caps = cash.gsub(/[^0-9]/,'').to_i / 2

  while number_of_caps >= 4
    bottles_returned = number_of_caps / 4
    number_of_caps = bottles_returned
    bottles_from_caps += bottles_returned
  end

  puts "If you recycle the caps you will get #{bottles_from_caps} bottles back"

  total_bottles = bottles_from_bottles + bottles_from_caps + initial_bottles

  puts "The total number of bottles you can redeem for #{cash} is #{total_bottles}" 
end until cash == "done"