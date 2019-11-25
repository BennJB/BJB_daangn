class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.belongs_to :user, null: false
      t.string :title, null: false
      t.integer :price, null: false
      t.text :description

      t.timestamps
    end
  end
end
