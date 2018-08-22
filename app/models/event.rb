class Event < ApplicationRecord
  has_many :users
  has_many :chats


  validates :name, presence: true
  validates :address, presence: true
  validates :time, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
