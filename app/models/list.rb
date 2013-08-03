class List < ActiveRecord::Base
  
  has_many :tasks
  class << self

    def add_list(name)
      self.create({name: name, active_list: List.all.first.active_list})
      puts "You've just created the following list: #{name}"
    end

    def all_lists(arg)
      puts "Lists:"
      self.all.each_with_index do |list, index|
        puts "#{((index + 1).to_s + ".").ljust(5)} #{list.name}"
      end
    end

    def select_list(list_number)
      List.all.each_with_index do |list, index| 
        list.active_list = list_number
        list.save
        Task.list(list_number.to_i, nil) if list_number.to_i == index + 1
      end
    end

    def delete_list(list_number)
      raise "We don't have a ##{list_number}, sorry." if list_number.to_i > self.all.count || list_number.to_i < 1
      list = self.all[list_number.to_i - 1]
      puts "You've just destroyed the following list: #{list.name}  Lazy bum!!"
      list.destroy
    end
  end
end
