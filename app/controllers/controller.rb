require_relative '../models/task.rb'

class Controller

  class << self

    def run
      begin
        command, desc_or_num = validate(ARGV)
        Task.send(command, desc_or_num)
        puts
      rescue StandardError => e
        puts e.message
        puts
      end
    end

    def validate(input)
      raise "Please use 'list', 'add', 'delete' or 'complete'" if input.length == 0
      command, desc_or_num = input.shift, input.join(" ")
      return command, desc_or_num if ['add', 'delete', 'complete', 'list'].include?(command)
      raise "Invalid input!  Tough luck."
    end

  end

end
