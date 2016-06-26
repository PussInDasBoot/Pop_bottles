# poppin_bottles.rb
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
  puts "You purchased #{@first_bottles} bottles. You get #{bottles(@first_bottles) - @first_bottles} bottles from bottle recycling
  and #{bottles(@second_caps)} bottles from cap recycling
  You will receive #{@final_bottles} bottles for your money!" 
end until response == "done"
puts "Thank you for playing"