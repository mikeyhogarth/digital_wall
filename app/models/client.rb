class Client < ActiveRecord::Base
  attr_accessible :name, :description
  
  has_many :presentations

end
