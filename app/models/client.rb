class Client < ActiveRecord::Base
  
  
  #properties
  attr_accessible :name, :description
  
  
  #validators
  validates_presence_of :name
  
  
  #associations
  has_many :presentations


end
