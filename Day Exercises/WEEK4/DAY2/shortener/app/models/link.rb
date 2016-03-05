class Link < ActiveRecord::Base

  def self.short(chars)
    #result=(0..2).map { (97 + rand(26)).chr }.join
    Array.new(chars.to_i){[ *'a'..'z', *'A'..'Z'].sample}.join
  end

end
