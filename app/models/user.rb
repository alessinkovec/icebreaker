class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :event
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true
end
