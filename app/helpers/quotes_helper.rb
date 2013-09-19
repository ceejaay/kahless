module QuotesHelper
  
  def authorized?
    @quote.authorized == true
  end

end
