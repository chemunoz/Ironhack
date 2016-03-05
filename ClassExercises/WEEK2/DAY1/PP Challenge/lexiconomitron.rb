require 'pry'

class Lexiconomitron
  def eat_t(phrase)
    phrase.gsub!(/[tT]/,"")
  end

  def shazam (array)
    result=[]
    aux= array.each do |item|
            item=eat_t(item.reverse!)
            end
            
    result.push(aux.shift)
    result.push(aux.pop)
    result
  end

  def oompa_loompa
    #Iteration 3 Pending 
  end
end



#lexico=Lexiconomitron.new.eat_t("HolaT Comot ettas!?")