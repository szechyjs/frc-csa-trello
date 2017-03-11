class Card
  include ActiveModel::Model
  attr_accessor :team_number, :name, :email, :mobile, :title, :description, :category

  validates :team_number, presence: true, numericality: { only_integer: true }
  validates :name, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
