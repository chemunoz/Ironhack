# By default, all methods in Ruby classes are public - accessible by anyone. There are, nonetheless, only two exceptions for this rule: the global methods defined under the Object class, and the initialize method for any class. Both of them are implicitly private.

class Midas
  def initialize(initial_gold)
    @gold = initial_gold
  end



  def take_gold_from(other)
    @gold += other.gold
  end

  private
  def gold
    @gold
  end

end

m1 = Midas.new(10)
m2 = Midas.new(20)

puts (m1.take_gold_from(m2))