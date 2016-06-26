# pop_bottles.rb
begin
  puts "How much would you like to spend?"
  cash = gets.chomp
  bottles_purchased = cash.gsub(/[^0-9]/,'').to_i / 2

  bottles_from_bottles = 0

  while bottles_purchased >= 2
    bottles_returned = bottles_purchased / 2
    bottles_purchased = bottles_returned
    bottles_from_bottles += bottles_returned
  end

  initial_bottles = (cash.gsub(/[^0-9]/,'').to_i / 2)

  puts "#{cash} will buy you #{initial_bottles} bottles.
  If you recycle your bottles you will get #{bottles_from_bottles} bottles back"

  bottles_from_caps = 0

  number_of_caps = cash.gsub(/[^0-9]/,'').to_i / 2

  while number_of_caps >= 4
    bottles_returned = number_of_caps / 4
    number_of_caps = bottles_returned
    bottles_from_caps += bottles_returned
  end

  puts "If you recycle your caps you will get #{bottles_from_caps} bottles back"

  total_bottles = bottles_from_bottles + bottles_from_caps + initial_bottles

  puts "The total number of bottles you can drink for #{cash} is #{total_bottles}" 
end until cash == "done"

## With recursion

begin
  puts "How much would you like to spend?"
  response = gets.chomp
  input = response.gsub(/[^0-9]/,'').to_i

  # def recycle(input)
  #   bottles(@first_bottles)
  #   caps(@first_caps)
  # end

  def bottles(n)
    return n if n <= 2
    n + bottles(n/2) 
  end

  def caps(n)
    return n if n <= 4
    n + caps(n/4)
  end

  @first_bottles = input / 2
  @first_caps = (input / 2) / 4
  @second_caps = caps(@first_caps)
  @final_bottles = bottles(@second_caps) + bottles(@first_bottles)
  puts "You purchased #{@first_bottles} bottles. You get #{bottles(@first_bottles) - @first_bottles} bottles from bottle recycling" \
  " and #{bottles(@second_caps)} bottles from cap recycling." \
  " You will receive #{@final_bottles} bottles for your money!" 
end until response == "done"
puts "Thank you for playing"