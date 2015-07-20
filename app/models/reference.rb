class MyValidator < ActiveModel::Validator
  def validate(menu)
    unless menu.url.starts_with? 'http'
      menu.errors[:url]  << ' must start with http or #, or you need to put a Url.'
    end
  end
end

class Reference < ActiveRecord::Base
  include ActiveModel::Validations
  if :url.present?
    validates_with MyValidator
  end
  validates :title, presence:true
end
