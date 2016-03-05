require 'pry' 
​
class ProgrammingLanguage
  attr_accessor :name, :age, :type
  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end
end
​
ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")
​
array_of_languages = [ruby, python, javascript, go, rust, swift, java]
​
def array_printer(array)
  array.each do | language |
    puts "Language: #{language.name} |  Age: #{language.age} |  Type System: #{language.type}"
  end
​
end
​
def increase_age(array)
aged_languages = array.map do | language |
  language.age +=1
  language
  end
  #binding.pry
  sort_age(aged_languages)
end
​
def sort_age(array)
  sort_languages = array.sort_by{ |language| language.age}.reverse
  delete_java(sort_languages)
end
​
def delete_java(array)
  array_delete = array.delete_at(6)
  #binding.pry
  array_printer(array_delete)
end
​
increase_age(array_of_languages)