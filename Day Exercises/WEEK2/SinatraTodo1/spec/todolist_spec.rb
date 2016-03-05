require 'rspec'
require 'pry'
require './todo.rb'

describe TodoList do
  before  :each do
    @todody=TodoList.new
  end

  describe "#add_task" do
    it "test if the task is saved" do
      obj1=Task.new("Buy the OBJ1")
      expect(@todody.add_task(obj1)).to eq(obj1)
    end
  end

  describe "#delete_task" do
    it "test if the task are erased" do
      #Creamos un array, se le pasamos a @tobody
      obj2=Task.new("Buy the OBJ2")
      obj3=Task.new("Buy the OBJ3")
      obj4=Task.new("Buy the OBJ4")
      @todody.add_task(obj2)
      @todody.add_task(obj3)
      @todody.add_task(obj4)
      #Eliminamos por ID 
      @todody.delete_task(obj3.id)
      #Buscamos ese ID y nos deberia devolver nil
      expect(@todody.tasks).to eq([obj2,obj4])
    end
  end

  describe "#find_task_by_id" do
    it "test if I can find a task in my todolist" do
      obj5=Task.new("Buy the OBJ5")
      @todody.add_task(obj5)
      expect(@todody.find_task_by_id(obj5.id)).to eq(obj5)
    end
  end
end




