class ConcertsController < ApplicationController
  def index
    #@concerts=Concert.all
    @concerts=Concert.concerts_today
    @concerts_to_come=Concert.concerts_to_come
  end

  def show
    @concert=Concert.find_by(id: params[:id])
    @comments_in_bbdd=@concert.comments
    @comment=Comment.new
  end

  def new
    @concert=Concert.new
  end

  def create
    @concert=Concert.new(concert_params)

    if @concert.save
      redirect_to concerts_path
    else
      render 'new'
    end

  end

  def price
    if params[:price]
      @concerts_price=Concert.search_concert_price(params[:price])
      @price_searched=params[:price]
      #redirect_to concerts_price_path
    end
  end

  def popular
    @con_com=[]
    Concert.popular_concerts.each do |k,v|
        @con_com.push([Concert.find_by(id: k), v])
    end
  end

  private
  def concert_params
    params.require(:concert).permit(:artist, :venue, :city, :date, :price, :description)
    #Nos aseguramos que haya una key "concert" y si la hay esas keys de permit
  end
end
