require_relative '../models/task.rb'

class Controller

  class << self

    def run
      command, input = validate(get_user_input)
      if task_num
        self.send(command, input)
      else
        self.send(command)
      end
    end

    def list
      puts "Tasks:"
      Task.all.with_index(1) do |task, index|
        puts "#{index}. [#{task.status == :complete ? "X" : " "}] #{task.description}"
      end
    end

    end

    def add(input)
    end

    def delete(input)
    end

    def complete(task_num)
    end

    def get_user_input
      ARGV
    end

    def validate(input)
      puts "Invalid input" if input.length > 2
      puts "Please use 'list', 'add', 'delete' or 'complete'" if input.length == 0
      if input.length == 2
        unless ['add', 'delete', 'complete'].include?(input[0])
          puts "Invalid input"
          exit
        end
        return input[0], input[1]
      end
      return input[0], nil if ['list'].include?(input[0])
    end

  end

end
