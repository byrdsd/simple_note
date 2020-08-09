class Note
  include Mongoid::Document
  validates :body, presence: true, length: { maximum: 1000 }
  validates :title, length: { maximum: 30 }
  belongs_to :user
  
  field :title, type: String
  field :body, type: String
  field :timestamp, type: String
end
