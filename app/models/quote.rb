class Quote < ActiveRecord::Base
  attr_accessible :authorized, :text
  validates :text, :presence => true, :uniqueness => true, :length => { :within => 10..150 }


end
