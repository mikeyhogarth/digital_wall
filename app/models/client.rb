class Client < ActiveRecord::Base
  attr_accessible :name
  
  has_many :presentations

end
