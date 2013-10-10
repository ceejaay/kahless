class Quote < ActiveRecord::Base
  attr_accessible :authorized, :text
  validates :text, :presence => true
  validates :text, :uniqueness => true
  validates :text, :length => { :within => 10..150 }

  

end
