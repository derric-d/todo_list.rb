movies = {
  Memento: 3,
  Primer: 4,
  Ishtar: 1
}

puts "What would you like to do?"
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie."
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."

choice = gets.chomp.downcase
case choice
when 'add'
  puts "What movie do you want to add?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "What's the rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been added with a rating of #{rating}."
  else
    puts "That movie already exists! Its rating is #{movies[title.to_sym]}."
  end
when 'update'
  puts "What movie do you want to update?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    puts "What's the new rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been updated with new rating of #{rating}."
  end
when 'display'
  movies.each do |movie, rating|
    puts "#{movie}: #{rating}"
  end
when 'delete'
  puts "What movie do you want to delete?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    movies.delete(title.to_sym)
    puts "#{title} has been removed."
  end
else
  puts "Sorry, I didn't understand you."
end



puts "What would you like to do?"
puts "-- Type 'create' to create a list"
puts "-- Type 'add' to add a task"
puts "-- Type 'update' to update a task"
puts "-- Type 'read' to read a specific task"
puts "-- Type 'display' to display all tasks"
puts "-- Type 'delete' to delete a task"

my_list = List.new 
    puts "you've created a new list" 
    my_list.add( Task.new('Make Breakfast')) 
    my_list.add( Task.new('wash after Breakfast')) 
    my_list.add( Task.new('pack lunch')) 
    my_list.add( Task.new('Get gas')) 
    puts "You have added a task to the Todo List" 
      if my_list.show.join.include?('#<')
        print [
          'Are you sure you are handling your task object correctly for showing',
        "as a string?\n"
            ]
        end
    puts 'Your task list:'
    puts my_list.show