class Notification < ActiveRecord::Base
  belongs_to :user
  # :subscribed_user = :notified_by
  belongs_to :subscribed_user, class_name: 'User'
  belongs_to :post
end
