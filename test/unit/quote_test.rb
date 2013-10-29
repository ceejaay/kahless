require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  
  test "should create quote" do 
    quote = Quote.new

    quote.text = "test text at least ten characters long."
    quote.authorized = false
    
    assert quote.save
  end
 
  test "should update quote.authorized" do
    quote = quotes(:kahless_quote)
    assert quote.update_attributes(authorized: true)
   
  end

  test "should show a quote" do
    quote_id = quotes(:kahless_quote).id
    assert_nothing_raised {Quote.find(quote_id)}
  end

  test "should delete a quote" do
    quote = quotes(:kahless_quote)
    quote.destroy
    assert_raise(ActiveRecord::RecordNotFound) {Quote.find(quote.id)}
  end

  test "should not create a quote if too short or missing" do
    quote = Quote.new
    assert !quote.valid?
    assert quote.errors[:text].any?
    assert_equal ["can't be blank", "is too short (minimum is 10 characters)"], quote.errors[:text]
  end

  test "should not create quote if is too long" do
    quote = Quote.new text: ""
    151.times do
      quote.text << "A"
    end
    quote.save
    assert !quote.valid?
    assert quote.errors[:text].any?
    assert_equal ["is too long (maximum is 150 characters)"], quote.errors[:text]
  end

  test "should not create quote if is a duplicate" do
    quote = quotes(:kahless_quote)
    new_quote = Quote.new
    new_quote.text = "text long enough to validate."
    new_quote.save 
    assert_equal ["has already been taken"], new_quote.errors[:text]
    
  end

end
