require 'pry'
# require_relative './task.rb'

class TodoList
    attr_reader :tasks
    def initialize
        @tasks = []
    end

    def add_task(taskk)
      @tasks.push(taskk)
      @tasks.last #lo hago para el test
    end

    def delete_task(index)
      @tasks.delete_if {|x| x.id==index }
    end

    def find_task_by_id(index)
      task2return=nil
      @tasks.each do |item|
        if item.id==index
          task2return=item
        end
      end
      task2return
    end

    def sort_by_created(method)
      sorted_tasks = @tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
      # binding.pry

      # # gender asc, name asc
      # p(dogs.sort do |a, b|
      #   [a[:gender], a[:name]] <=> [b[:gender], b[:name]]
      # end)

      # # gender desc, name asc
      # p(dogs.sort do |a, b|
      #   [b[:gender], a[:name]] <=> [a[:gender], b[:name]]
      # end)

      # # gender asc, name desc
      # p(dogs.sort do |a, b|
      #   [a[:gender], b[:name]] <=> [b[:gender], a[:name]]
      # end)
    end
end




#  todody=TodoList.new
#  obj1=Task.new("Buy the milk")
#  obj2=Task.new("Buy the OBJ2")
#  obj3=Task.new("Buy the OBJ3")
#  obj4=Task.new("Buy the OBJ4")

#  todody.add_task(obj1)
#  todody.add_task(obj2)
#  todody.add_task(obj3)
#  todody.add_task(obj4)

# # todody.find_task(obj1.id)
#   todody.sort_by_created