class List < ActiveRecord::Base
  
  has_many :tasks
  class << self

    def add_list

    end

    def all_lists(arg)
      puts "Lists:"
      self.all.each_with_index do |list, index|
        puts "#{((index + 1).to_s + ".").ljust(5)} #{list.name}"
      end
    end

    def select_list

      
    end

    def delete_list


    end
  end
end
