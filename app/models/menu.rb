class MyValidator < ActiveModel::Validator
  def validate(menu)
    unless menu.url.starts_with?('http') || menu.url.starts_with?('#')
      if menu.url.present?
        menu.errors[:url] << ' must start with http or #.'
      else
        menu.errors[:url]  << ' must be filled in.'
      end
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
    if menu_id
      Menu.find self.menu_id
    else
      nil
    end
  end
  def parenter
    parents = ""
    if self.parent != nil
      parents = self.parent.parenter + " > " + title
    else
      parents = title
    end
    return parents
  end
  validates :title, presence: true
end
