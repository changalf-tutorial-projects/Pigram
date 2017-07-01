class Profile < ActiveRecord::Base
  
  # The 'dependent: destroy' destroys all objects associated with this object
  belongs_to :user
  has_many :posts
  
end