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
   if  @quote.save
       redirect_to root_path,  notice: "Your quote will be reviewed by the great Kahless"
   else
       redirect_to new_path, notice: "Please address the problems below."
     @quote.errors
   end  
  end
end
