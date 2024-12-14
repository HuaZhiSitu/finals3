class CreateBids < ActiveRecord::Migration[7.1]
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.decimal :amount
      t.integer :skin_id

      t.timestamps
    end
  end
end
