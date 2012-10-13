class Concept < ActiveRecord::Base
  attr_accessible :description, :name, :image

  has_attached_file :image, :styles => { :thumbnail => "300"}

  belongs_to :presentation

end
