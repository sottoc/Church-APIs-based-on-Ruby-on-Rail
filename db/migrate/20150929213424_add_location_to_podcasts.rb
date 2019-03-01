class AddLocationToPodcasts < ActiveRecord::Migration[5.0]
  def change
    add_reference :podcasts, :location, index: true
  end
end
