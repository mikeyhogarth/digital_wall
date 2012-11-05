class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :administrator, :client_id
  
  has_secure_password
  
  validates_presence_of :password, :on => :create

  belongs_to :client
  has_many :annotations
  has_one :profile
    
  def administrator?
    administrator || false
  end
  
  def client?
    client.present?
  end
  
  def has_profile?
    profile || false
  end
  
  def nice_name
    if(has_profile? and profile.first_name and profile.last_name)
      return "#{profile.first_name} #{profile.last_name}"
    else
      return username
    end
  end
end
