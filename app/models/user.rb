class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]

  mount_uploader :avatar, AvatarUploader
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :posts
  belongs_to :role

  validates :name, presence: true
  validate  :avatar_size

  def self.find_for_google_oauth2(auth)
    user = User.where(email: auth.info.email).first

    unless user
      user = User.create(name:     auth.info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20])
    end
    user
  end

  def admin?
    self.role.name == "admin"
  end

  def moderator?
    self.role.name == "moderator"
  end

  def user?
    self.role.name == "user"
  end

  private
  def avatar_size
    if avatar.size > 5.megabytes
      errors.add(:user_avatar, "should be less than 5MB")
    end
  end

end
