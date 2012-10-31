class Concept < ActiveRecord::Base


  #properties
  attr_accessible :name, :description, :image  
  has_attached_file :image, :styles => { :thumbnail => "200x200", :average => "300x300" }
  
  #validation
  validates_presence_of :name, :description
  validates_attachment_presence :image
  validates :description, :length => { :minimum => 15}

  #associations
  belongs_to :presentation

  #scope
  default_scope :order => "created_at DESC"
  
  def next_concept
    presentation.concepts.where(["created_at < ?", created_at]).first || presentation.concepts.first
  end
  
  def previous_concept
    presentation.concepts.where(["created_at > ?", created_at]).first || presentation.concepts.last
  end
end
