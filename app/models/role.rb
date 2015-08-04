class Role < ActiveRecord::Base

  has_many :users

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :description, presence: true
  validates :description, length: { minimum: 15 }

end
