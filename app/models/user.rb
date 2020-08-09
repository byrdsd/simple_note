class User
  include Mongoid::Document
  attr_reader :user_id
  
  field :username, type: String
  field :password, type: String
  field :email, type: String
end
