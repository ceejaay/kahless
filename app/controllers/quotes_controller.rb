class QuotesController < ApplicationController

  def show

  end


  def index
    @quote = Quote.where(authorized: true).all.sample
  end


  def new
    @quote = Quote.new 
  end


  def create
    @quote = Quote.new(params[:quote])
   if  @quote.save
       redirect_to root_path,  notice: "Your quote will be reviewed by the great Kahless"
   else
      render 'new'
      # redirect_to new_path, notice: "Please address the problems below."
   end  
  end
  
  def admin_page
    @quote = Quote.where(authorized: false)
  end

  def update
    @quote = Quote.find(params[:id])
    @quote.authorized = true
    @quote.save
    redirect_to admin_page_path
  end
  
  def picture
    
  end

end
