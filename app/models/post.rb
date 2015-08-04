class Post < ActiveRecord::Base

  belongs_to :user

  acts_as_punchable
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable
  acts_as_commentable
  has_reputation :votes, source: :user, aggregated_by: :sum

  scope :active, -> { where status: 'active'}
  scope :deactivate, -> { where status: 'deactivate'}

  validates :tag_list, presence: true
  validates :title, presence: true
  validates :title, length: { minimum: 3 }
  validates :content, presence: true
  validates :content, length: { minimum: 150 }
  validates :tag_list, presence: true


end
