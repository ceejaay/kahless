class QuotesController < ApplicationController

  def show
    @quote = Quote.where(authorized: true).all.sample
  end


  def index
  end


  def new
    @quote = Quote.new 
  end


  def create
    @quote = Quote.new(params[:quote])
    @quote.save
       redirect_to root_path,  notice: "Your quote will be reviewed by the great Kahless"
     
  end
end
