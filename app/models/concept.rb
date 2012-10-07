class Concept < ActiveRecord::Base
  attr_accessible :description, :image_url, :name

  belongs_to :presentation

end
