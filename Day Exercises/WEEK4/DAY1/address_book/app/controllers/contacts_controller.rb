class ContactsController < ApplicationController

  def home
    #render 'home' #NO es necesario por la convención de nombres
  end

  def index
    # @contacts = Contact.last(10)
    @contacts = Contact.all
  end

  def show
    @contact=Contact.find params[:id]
  end

  def new

  end

  def create
    contact = Contact.new(
        :name => params[:contact][:name],
        :address => params[:contact][:address],
        :phone_number => params[:contact][:phone],
        :email_address => params[:contact][:email])

    # Now we save the contact
    contact.save

    #render(:text => contact.attributes)
    redirect_to("/contacts")
  end
end
