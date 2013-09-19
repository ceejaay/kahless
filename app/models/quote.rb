class Quote < ActiveRecord::Base
  attr_accessible :authorized, :text
  validates :text, :presence => true
  validates :text, :uniqueness => true
  validates :text, :length => { :within => 3..300 }

  

end
