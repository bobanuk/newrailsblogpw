class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  default_scope -> { order('created_at ASC') }

  has_reputation :votes, source: :user, aggregated_by: :sum

  validates :comment, presence: true, length: { maximum: 200 }


end
