class Note < ActiveRecord::Base
  validates :title, :content, presence: true
  validate :expiration_date_cannot_be_in_the_past
  def expiration_date_cannot_be_in_the_past
    errors.add(:expires, "can't be in the past") if
    !expires.blank? and expires < Date.today
  end
end
