class Presentation < ActiveRecord::Base
  attr_accessible :client_id, :description, :name

  validates_presence_of :name

  belongs_to :presentation

end
