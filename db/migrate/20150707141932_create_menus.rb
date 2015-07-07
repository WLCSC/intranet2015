class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.string :url
      t.integer :menu_id

      t.timestamps null: false
    end
  end
end
