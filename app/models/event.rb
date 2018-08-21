class Event < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :address, presence: true
  validates :time, presence: true
end
