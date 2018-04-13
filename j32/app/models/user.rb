class User < ApplicationRecord
  has_and_belongs_to_many :boards
  has_and_belongs_to_many :archived_boards
  has_and_belongs_to_many :matches
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  validates :firstname, presence: true, length: { in: 2..50 }
  validates :lastname, presence: true, length: { in: 2..50 }

  #FRENCH_PHONE_REGEX = ^(0|\+33)[1-9]([-. ]?[0-9]{2}){4}$
  #validates :lastname, presence: true, length: { in: 2..50 }
  #validates :bio, presence: true
  #validates :phone, presence: true, format: { with: FRENCH_PHONE_REGEX }

  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" }, :default_url => ":style/missing_avatar.png"  # Can't seed db if these lines aren't commented
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/    # Can't seed db if these lines aren't commented
  
end
