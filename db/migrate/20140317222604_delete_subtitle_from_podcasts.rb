class DeleteSubtitleFromPodcasts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :podcasts, :subtitle
  end
end
