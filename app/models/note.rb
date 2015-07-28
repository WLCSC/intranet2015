class Note < ActiveRecord::Base
  validates :title, :content, presence: true
  validate :expiration_date_cannot_be_in_the_past
  def expiration_date_cannot_be_in_the_past
    errors.add(:expires, "can't be today or in the past") if
    !expires.blank? && expires <= Date.today
  end
  validates :expires, date: true
end
