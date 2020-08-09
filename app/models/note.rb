class Note
  include Mongoid::Document
  belongs_to :user
  
  field :title, type: String
  field :body, type: String
  field :timestamp, type: String
end
