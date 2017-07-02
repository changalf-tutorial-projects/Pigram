class User < ActiveRecord::Base
  acts_as_voter
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :avatar, styles: {medium: '152x152#'}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  # The 'dependent: :destroy' command destroys all objects associated with a user (ie. all photos of user) 
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
         
  validates :username, presence: true, length: {minimum: 4, maximum: 30}
end
