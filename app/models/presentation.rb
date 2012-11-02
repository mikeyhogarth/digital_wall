class Presentation < ActiveRecord::Base

  #properties
  attr_accessible :client_id, :description, :name, :active

  #validation
  validates_presence_of :name

  #associations
  belongs_to :client
  has_many :concepts

  #methods
  def has_concept?
    concepts.first.present?
  end
  
end
