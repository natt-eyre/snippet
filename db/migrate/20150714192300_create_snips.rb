class CreateSnips < ActiveRecord::Migration
  def change
    create_table :snips do |t|
      t.string :name, null:false
      t.string :description
      t.text :content, null:false

      t.timestamps null: false
    end
  end
end
