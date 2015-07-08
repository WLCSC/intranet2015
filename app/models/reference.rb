class MyValidator < ActiveModel::Validator
  def validate(menu)s
    unless menu.url.starts_with? 'http'
      menu.errors[:url]  << 'URL must start with http.'
    end
  end
end

class Reference < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  validates :title, :external, presence:true
end
