require_relative '../models/task.rb'

class Controller

  class << self

    def run
      command, desc_or_num = validate(get_user_input)
      if desc_or_num
        self.send(command, desc_or_num)
      else
        self.send(command)
      end
    end

    def list
      puts "Tasks:"
      Task.all.each do |task|
        puts "#{task.id}. [#{task.status == :complete ? "X" : " "}] #{task.description}"
      end
    end

    def add(task)
    end

    def delete(task)
    end

    def complete(task_num)
    end

    def get_user_input
      ARGV
    end

    def validate(input)
      desc_or_num = nil
      if input.length == 0
        puts "Please use 'list', 'add', 'delete' or 'complete'" 
      end
      command = input[0]
      desc_or_num = input[1..-1].join(" ") if input.length > 1  #rename
      if ['add', 'delete', 'complete'].include?(command)
        raise InvalidError, "Invalid input!  Tough luck." if desc_or_num == nil
      elsif command == "list"
        return command, nil
      # if input.length == 2
      #   unless 
      #     puts "Invalid input"
      #     exit
      #   end
      #   return input[0], input[1]
      # end
      # return input[0], nil if ['list'].include?(input[0])
      end
    end

  end

end
