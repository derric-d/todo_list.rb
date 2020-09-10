module Menu
	def menu
		"Welcome to your todo list
		use this menu to navigate the system
		1) Add task
		2) Show task list
		3) Update
		4) Delete task
		5) Write to a file 
		6) Read from 
		7) Toggle status
		Q) Quit "
	end
	def show
		menu
	end
	
	
	

end

module Prompttable
	def prompt(message = 'What would you like to do', symbol = ':> ')
		print message
		print symbol
		gets.chomp
	end
end



class List
	attr_reader :all_tasks
	
	def initialize
		@all_tasks = []
	end

	def add(task)
		all_tasks << task
	end
	
	def delete(task_number)
		all_tasks.delete_at(task_number - 1)
	end

	def update(task_number, task)
		all_tasks[task_number - 1] = task
	end	

	def show
		all_tasks.map.with_index { |l, i| "(#{i.next}): #{l}"}
	end

	
	def write_to_file(filename)
		machinified = @all_tasks.map(&:to_machine).join("\n")
		IO.write(filename, machinified)
	end
	def read_from_file(filename)
		IO.readlines(filename).each do |line|
			status, *description = line.split(':')
			status = status.include?('x')
			add(Task.new(description.join(':').strip, status))
		end
	end
	def toggle(task_number)
		all_tasks[task_number - 1].toggle_status
	end
end

class Task
	attr_reader :description
	attr_accessor :completed_status
	def initialize(description, completed_status = false)
		@description = description
		@completed_status = completed_status
	end

	def to_s
		"#{represent_status} : #{description}"
	end

	def completed?
		completed_status
	end

	def toggle_status
		@completed_status = !completed?
	end
	def to_machine
		"#{represent_status}:#{description}"
	end

	private

	def represent_status
		completed? ? '[X]' : '[ ]'
	end	
end

if __FILE__ == $PROGRAM_NAME 
    include Menu
    include Prompttable
    my_list = List.new
    puts "please choose from the following table: "
    	until ['q'].include?(user_input = prompt(show).downcase)
    		case user_input
    			when '1'
    				my_list.add(Task.new(prompt('What is the task you would like to accomplish?')))
    			
    			
    			when '2'
    				puts my_list.show
    			when '3'
    				my_list.update(prompt('Which task to update?').to_i, 
    					Task.new(prompt('Task Description?')))
    			
    			when '4'
              		puts my_list.show
              		my_list.delete(prompt('Which task to delete?').to_i)    				

    			when '5'
    				my_list.write_to_file(prompt('What is the filename you want to write to? '))
    			when '6'
    				begin
    					my_list.read_from_file(prompt('What file do you want to read from? '))
    				rescue Errno::ENOENT
			            puts 'File name not found, please verify your file name 
			            and path.'
			        end
    			when '7'
		            puts my_list.show
		            my_list.toggle(prompt('Which would you like to toggle the status for?').to_i)

    			
    			else
    				puts 'sorry, didnt understand'
    		end		    		
    		prompt("press enter to continue ")
    	end
    puts "Outro - Thanks for using the menu "
end
#comment
