class AddFileDataToPodcasts < ActiveRecord::Migration[5.0]
  def change
    add_column :podcasts, :file_data, :text
  end
end
