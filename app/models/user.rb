class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable , :omniauthable , omniauth_providers: [:google_oauth2]

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :profile, dependent: :destroy

def self.from_omniauth(data)

  # can be accessed by User.from_omniauth
   user = User.find_by(email: data.email)
    if !user.blank?
    if user.confirmed_at.blank?
   	user.confirmed_at = Time.now
   	user.save
   end
end
    if user.blank?
   	user = User.create(
   			email: data.email,
   			password: SecureRandom.uuid,
   			confirmed_at: Time.now
   		)
   end
    return user
   end
end
