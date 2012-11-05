class Profile < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  
  belongs_to :user
end
