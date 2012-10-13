class Concept < ActiveRecord::Base


  #properties
  attr_accessible :name, :description, :image  
  has_attached_file :image, :styles => { :thumbnail => "300"}

  
  #validation
  validates_presence_of :name


  #associations
  belongs_to :presentation


  #scope
  default_scope :order => "created_at DESC"
end
