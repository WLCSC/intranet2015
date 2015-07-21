class MyValidator < ActiveModel::Validator
  def validate(menu)
    unless menu.url.starts_with? 'http'
      if menu.url.present?
        menu.errors[:url]  << ' must start with http.'
      else
        menu.errors[:url]  <<  ' must be filled in'
      end
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
