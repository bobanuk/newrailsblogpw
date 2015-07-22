class Post < ActiveRecord::Base

  belongs_to :user

  acts_as_punchable
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable

  scope :active, -> { where status: 'active'}
  scope :deactivate, -> { where status: 'deactivate'}

  validates :tag_list, presence: true

end
