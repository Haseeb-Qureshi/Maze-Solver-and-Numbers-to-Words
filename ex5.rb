def towers_of_hanoi
  arr = [[3,2,1], [], []]
  complete_array = arr[0].clone
  complete_array.freeze
  loop do
    puts "Which column do you want to select from?"
    where_from = gets.chomp.to_i - 1
    puts "Which column do you want to put it on?"
    where_to = gets.chomp.to_i - 1
    arr[where_to] << arr[where_from].pop
    p arr
    break if arr[2] == complete_array
  end
  puts "You did it."
end

towers_of_hanoi
