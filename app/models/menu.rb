class MyValidator < ActiveModel::Validator
  def validate(menu)
    unless menu.url.starts_with?('http') || menu.url.starts_with?('#')
      menu.errors[:url]  << 'must start with http or #.'
    end
  end
end

class Menu < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  def children
    Menu.where(menu_id: self.id)
  end
  def parent_id
    self.menu_id
  end
  def parent
    Menu.find self.menu_id
  end
end
