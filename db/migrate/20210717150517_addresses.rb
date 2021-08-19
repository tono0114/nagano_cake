class Addresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.string :name
      t.string :postal_code
      t.string :address
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
