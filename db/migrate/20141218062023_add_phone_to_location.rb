class AddPhoneToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :phone, :string
  end
end
