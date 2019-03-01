class CreatePodcasts < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :author
      t.datetime :dateof

      t.timestamps
    end
  end
end
