puts "hello, welcome to ruby on rails"
class TodoList
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
    puts "Added task: '#{task}'"
  end

  def view_tasks
    if @tasks.empty?
      puts "No tasks in the list."
    else
      puts "Your To-Do List:"
      @tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end
  end

  def delete_task(index)
    if index.between?(1, @tasks.length)
      removed_task = @tasks.delete_at(index - 1)
      puts "Deleted task: '#{removed_task}'"
    else
      puts "Invalid task number."
    end
  end

  def menu
    loop do
      puts "\nTo-Do List Menu:"
      puts "1. Add Task"
      puts "2. View Tasks"
      puts "3. Delete Task"
      puts "4. Exit"
      print "Choose an option: "
      choice = gets.chomp.to_i

      case choice
      when 1
        print "Enter the task: "
        task = gets.chomp
        add_task(task)
      when 2
        view_tasks
      when 3
        print "Enter the task number to delete: "
        task_number = gets.chomp.to_i
        delete_task(task_number)
      when 4
        puts "Exiting the program. Goodbye!"
        break
      else
        puts "Invalid option. Please try again."
      end
    end
  end
end

# Create a new TodoList instance and start the menu
todo_list = TodoList.new
todo_list.menu