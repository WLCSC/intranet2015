class MyValidator < ActiveModel::Validator
  def validate(menu)
    unless menu.url.starts_with? 'http'
      menu.errors[:url]  << ' must start with http or #.'
    end
  end
end

class Reference < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  validates :title, presence:true
end
