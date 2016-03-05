require 'pry'

class Task
    attr_reader :content, :id, :created_at
    @@current_id = 1
    def initialize(content)
      @content = content
      @id = @@current_id
      @@current_id += 1
      @complete=false
      #created_at=Time.now.strftime("%m")
      @created_at=Time.now.strftime("%d/%b/%Y:%H:%M:%S")
      @updated_at=0
    end

    def complete?
      @complete
    end

    def complete!
      @complete=true
    end

    def make_incomplete!
      @complete=false
    end

    def update_content!(update)
      @updated_at=Time.now.strftime("%d/%b/%Y:%H:%M:%S")
      @content=update
    end
end



# task = Task.new("Buy the milk")
# # puts task.id # 1
# todo=TodoList.new
# todo.add_task(task)

# task2 = Task.new("Wash the car")
# puts task2.id # 2


# task.completed? # false
# task.complete!
# task.completed? # true



