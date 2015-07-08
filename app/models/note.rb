class Note < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :user_sid, format: {width: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  validate :expiration_date_cannot_be_in_the_past
  def expiration_date_cannot_be_in_the_past
    if note.expires.present? && expiration_date < Date.today
      errors.add(:expires, "can't be in the past")
    end
  end
end
