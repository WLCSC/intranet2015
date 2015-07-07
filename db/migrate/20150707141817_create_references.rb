class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :title
      t.string :url
      t.string :username
      t.string :password
      t.boolean :external
      t.text :notes

      t.timestamps null: false
    end
  end
end
