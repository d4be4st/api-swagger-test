class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  validates_presence_of :email, :username
end
