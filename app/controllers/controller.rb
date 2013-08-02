require_relative '../models/task.rb'

class Controller

  class << self

    def run
      input = get_user_input
      self.send(input)
    end

    def list
    end

    def add
    end

    def delete
    end

    def 

    def get_user_input
    end

  end

end
