require 'rspec'
require './tdd_spec.rb'

class Movie
  def initialize
  end

  def addData(title, director, star, cast, writer, producer)
    @hash={title: title, director: director, star: star, cast: cast, writer: writer, producer: producer}
    @hash
  end

  def showCredits
    puts
  end
end


class Person
  def initialize(name)
    roles_counter={director: 0,star: 0, cast: 0}
  end

  def rol(types) #Hash {:director}
    roles_counter.each do |key, item|
      item[types]+=1
    end

    types.each do |key, item|
      item+=1
    end
  end


end

Leonardo=Person.new("Leonardo Dicaprio")
Leonardo.rol([:director, :actor])


