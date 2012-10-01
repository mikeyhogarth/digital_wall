class Concept < ActiveRecord::Base
  attr_accessible :description, :image_url, :name

  belongs_to :client
  has_many :concepts

end
