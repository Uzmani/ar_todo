require_relative '../models/task.rb'
require_relative '../models/list.rb'

class Controller

  class << self

    def run
      begin
        command, desc_or_num = validate(ARGV)
        command.include?('_list') ? List.send(command, desc_or_num) : Task.list_command(command, desc_or_num)
        puts
      rescue StandardError => e
        puts e.message
        puts e.backtrace.inspect
        puts
      end
    end

    def validate(input)
      raise "Please use 'list', 'add', 'delete' or 'complete'" if input.length == 0
      command, desc_or_num = input.shift, input.join(" ")
      available_commands = ['add', 'delete', 'complete', 'list', 'all_lists', 'add_list', 'delete_list', 'select_list']
      return command, desc_or_num if available_commands.include?(command)
      raise "Invalid input!  Tough luck."
    end

  end

end
