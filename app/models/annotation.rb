class Annotation < ActiveRecord::Base
  attr_accessible :body, :x, :y
  
  belongs_to :user
  belongs_to :concept
  
  validates_presence_of :body, :x, :y, :user_id, :concept_id
end
