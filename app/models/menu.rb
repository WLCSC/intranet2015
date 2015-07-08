class MyValidator < ActiveModel::Validator
  def validate(menu)
    unless menu.url.starts_with? 'http'
      menu.errors[:url]  << 'URL must start with http.'
    end
  end
end

class Menu < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  def children
    Menu.where(menu_id: id)
  end
end
