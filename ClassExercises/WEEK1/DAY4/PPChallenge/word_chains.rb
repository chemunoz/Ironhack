
class WordChain
  require 'ruby-dictionary'
  def initialize(dictionary)
      @dictionary = dictionary
  end

  def find_chain(start, final, diccio)
    word2search=constructor_word(start.split(//), final.split(//))
    puts diccio.exists?(word2search)
    #puts diccio.exists?("dauw")
    #while word != true
    #end
  end

  def constructor_word(startArray, finalArray)
    contrucArray=[]
    contrucArray[0]=finalArray[0]
    
    counter=0
    startArray.each do |item|
      if counter!=0
        contrucArray[counter]=item
      end
      counter+=1
    end 
    contrucArray.join

    #puts contrucArray
  end
end

list_of_words = ["hola", "adios", "hasta luego"]
dictionary = Dictionary.from_file('/usr/share/dict/words') #(list_of_words)
my_chain = WordChain.new(dictionary)
my_chain.find_chain("cat", "dog", dictionary)
# cat
# cot
# cog
# dog