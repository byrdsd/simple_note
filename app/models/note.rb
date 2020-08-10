class Note
  include Mongoid::Document
  validates :body, length: { maximum: 1000 }, presence: true, unless: :title?
  validates :title, length: { maximum: 30 }, presence: true, unless: :body?
  belongs_to :user
  
  field :title, type: String
  field :body, type: String
  field :timestamp, type: String

  private

  def body?
    !body.empty?
  end

  def title?
    !title.empty?
  end
end
