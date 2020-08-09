class User
  include ActiveModel::SecurePassword
  include Mongoid::Document
  has_secure_password

  attr_reader :user_id
  has_many :notes
  
  field :username, type: String
  field :password_digest, type: String
  field :email, type: String
  field :active_at, type: Integer

  index({ username: 1 }, { unique: true, name: "username_index" })
end
