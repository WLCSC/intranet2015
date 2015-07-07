class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.string :title
      t.string :user_sid
      t.date :expires

      t.timestamps null: false
    end
  end
end
