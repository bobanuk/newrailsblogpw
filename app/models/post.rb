class Post < ActiveRecord::Base

  belongs_to :user

  acts_as_punchable
  extend FriendlyId
  friendly_id :title, use: :slugged

end
