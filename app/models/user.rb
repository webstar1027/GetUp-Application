class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum gender: [:male, :female]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :twitter]
  enum role: [:user, :business_owner, :super_admin, :normal_user]
  after_initialize :set_default_role, :if => :new_record?
  scope :business_owners, -> { where(role: "business_owner") }
  has_one_attached :avatar
  has_many_attached :images
  has_one :business
  has_many :deals
  has_many :coupons
  has_many :claimed_deals, through: :coupons, source: :deal

  def set_default_role
    self.role ||= :business_owner
  end

  class << self
    def from_omniauth(auth)
      data = auth.info
      user = data.email.present? ? User.find_by(email: data.email, provider: auth.provider, uid: auth.uid) : nil
      if data.email.present? && user.blank?
        user = User.create(provider: auth.provider, uid: auth.uid, email: data.email, password: Devise.friendly_token[0, 20],
                           username: "#{data.first_name}#{data.last_name}")
      end
      user
    end
  end
           
end
