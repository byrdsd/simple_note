class User
  include ActiveModel::SecurePassword
  include Mongoid::Document
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, length: { in: 8..20 }
  has_secure_password

  attr_reader :user_id
  has_many :notes
  
  field :username, type: String
  field :password_digest, type: String
  field :email, type: String
  field :active_at, type: Integer

  index({ username: 1 }, { unique: true, name: "username_index" })
  index({ email: 1 }, { unique: true, name: "email_index" })

  def logged_in
  end
end
