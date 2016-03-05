require 'pry'

class EmailProvider
  def initialize
    @emails=Hash.new {|h,k| h[k]=[]}
  end

  def add_email(address, subject)
    array=[]
    array.push(address)
    array.push(subject)
    @emails[:address]=address
    

    ht = Hash.new {|h,k| h[k]=[]}
    ht["cats"] << "Jellicle"
    ht["cats"] << "Mr. Mistoffelees"
    ht["dogs"]
    p ht

    # @emails[:address] = address
    # @emails[:subject] = subject
    binding.pry
    @emails
  end

  def get_subjects

  end
end



direc1=EmailProvider.new.add_email("hola@ironhack.com", "Hola k ase")
direc2=EmailProvider.new.add_email("adios@ironhack.com", "Weno, fue un gusto!")