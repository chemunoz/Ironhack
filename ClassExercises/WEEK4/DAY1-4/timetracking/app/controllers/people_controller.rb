class PeopleController < ApplicationController
  def new
    @person=Person.new
  end

  def create
    @person=Person.new(person_params)

    if @person.save
      redirect_to action: :index, controller: :projects  #:people
    else
      render 'new'
    end
  end

  private
  def person_params
    params.require(:person).permit(:name)
  end
end
