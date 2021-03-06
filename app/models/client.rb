class Client < ActiveRecord::Base
  
  
  #properties
  attr_accessible :name, :description, :logo
  has_attached_file :logo, :styles => { :thumbnail => "100x100", :original => "300x300" }  

  #validators
  validates_presence_of :name
  validates_attachment_content_type :logo, :content_type => ['image/gif', 'image/jpeg', 'image/png']  
  
  #associations
  has_many :presentations
  has_many :users

end
