class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :administrator, :client_id
  
  has_secure_password
  
  validates_presence_of :password, :on => :create
  
  belongs_to :client
  has_many :annotations
  
  def administrator?
    administrator || false
  end
  
  def client?
    client.present?
  end
  
end
