class User < ActiveRecord::Base
 rolify   
   has_secure_password
   has_many  :ingredients
   validates :nickname, uniqueness: true
   
end
