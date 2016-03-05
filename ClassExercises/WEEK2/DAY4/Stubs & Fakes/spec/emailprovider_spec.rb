require 'rspec'
require 'pry'
require './emailprovider.rb'

describe EmailProvider do 
  before  :each do
    @email_object=EmailProvider.new
  end
  
  #describe "Test if add_email method adds emails" do
  it "Test if add_email method adds emails" do
    @email_object.add_email("hola@ironhack.com", "Hola k ase")
    @email_object.add_email("adios@ironhack.com", "Weno, fue un gusto!")
    expect(@tasky.complete!).to eq(true)
  end
  #end

end
