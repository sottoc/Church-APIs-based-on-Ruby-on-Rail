class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.date :received
      t.references :source, index: true
      t.integer :amount

      t.timestamps
    end
  end
end
