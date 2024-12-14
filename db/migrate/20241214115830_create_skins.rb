class CreateSkins < ActiveRecord::Migration[7.1]
  def change
    create_table :skins do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.decimal :starting_price

      t.timestamps
    end
  end
end
