class AddFeaturedToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :featured, :boolean
  end
end
