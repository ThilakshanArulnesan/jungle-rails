class User < ActiveRecord::Base
  #uses bcrypt for authentication
  has_secure_password
end
