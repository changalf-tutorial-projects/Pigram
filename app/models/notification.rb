class Notification < ActiveRecord::Base
  validates :user_id, :notified_by_id, :post_id, :identifier, :notice_type, presence: true
  
  belongs_to :user
  # :subscribed_user = :notified_by
  belongs_to :subscribed_user, class_name: 'User'
  belongs_to :post
end
