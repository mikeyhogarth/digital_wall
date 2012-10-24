class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :administrator
  
  has_secure_password
  validates_presence_of :password, :on => :create
  
  belongs_to :client
  
  def administrator?
    administrator || false
  end
  
  def client?
    client.present?
  end
  
end
