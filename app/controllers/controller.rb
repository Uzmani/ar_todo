require_relative '../models/task.rb'

class Controller

  class << self

    def run
      begin
        command, desc_or_num = validate(ARGV)
        if desc_or_num
          self.send(command, desc_or_num)
        else
          self.send(command)
        end
        puts
      rescue StandardError => e
        puts e.message
        puts
      end
    end

    def list
      puts "Tasks:"
      Task.all.each_with_index do |task, index|
        puts "#{((index + 1).to_s + ".").ljust(5)}[#{task.status == "complete" ? "X" : " "}] #{task.description}"
      end
    end

    def add(task)
      Task.create({description: task, status: "incomplete"})
      puts "You've just created the following task: #{task}"
    end

    def delete(task_num)
      raise "The list doesn't have a ##{task_num}, sorry." if task_num.to_i > Task.all.count
      task = Task.all[task_num.to_i - 1]
      puts "You've just destroyed the following task: #{task.description}  Lazy bum!!"
      task.destroy
    end

    def complete(task_num)
      task = Task.all[task_num.to_i - 1]
      task.status = "complete"
      task.save
      puts "You've just completed the following task: #{task.description}  Congrats!!"
    end

    def validate(input)
      raise "Please use 'list', 'add', 'delete' or 'complete'" if input.length == 0
      command, desc_or_num = nil, nil
      command = input[0] if input.length > 0
      return command, nil if command == "list"
      desc_or_num = input[1..-1].join(" ") if input.length > 1  #rename
      return command, desc_or_num if ['add', 'delete', 'complete'].include?(command)
      raise "Invalid input!  Tough luck."
    end

  end

end
