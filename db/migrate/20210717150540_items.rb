class Items < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.string  :name
      t.string  :image_id
      t.text    :introduction
      t.integer :price
      t.boolean :is_active, default: true, null: false

    end
  end
end
