class Task < ActiveRecord::Base

  belongs_to :list

  class << self

    def list(list_num, nil_num)
      puts "Tasks:"
      self.where('list_id = ?', list_num).each_with_index do |task, index|
        puts "#{((index + 1).to_s + ".").ljust(5)}[#{task.status == "complete" ? "X" : " "}] #{task.description}"
      end
    end

    def add(list_num, task)
      self.create({description: task, status: "incomplete", list: List.all[list_num - 1]})
      puts "You've just created the following task: #{task}"
    end

    def delete(list_num, task_num)
      raise "The list doesn't have a ##{task_num}, sorry." if task_num.to_i > self.where('list_id = ?', list_num).count || task_num.to_i < 1
      task = self.where('list_id = ?', list_num)[task_num.to_i - 1]
      puts "You've just destroyed the following task: #{task.description}  Lazy bum!!"
      task.destroy
    end

    def complete(list_num, task_num)
      raise "The list doesn't have a ##{task_num}, sorry." if task_num.to_i > self.all.count || task_num.to_i < 1
      task, task.status = self.where('list_id = ?', list_num)[task_num.to_i - 1], "complete"
      task.save
      puts "You've just completed the following task: #{task.description}  Congrats!!"
    end
  
    def list_command(command, input)
      self.send(command, List.all.first.active_list, input)
    end

  end
end
