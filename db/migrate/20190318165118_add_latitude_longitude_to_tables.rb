class AddLatitudeLongitudeToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :latitude, :decimal, :precision => 15, :scale => 13
    add_column :cities, :longitude, :decimal, :precision => 15, :scale => 13
    add_column :events, :latitude, :decimal, :precision => 15, :scale => 13
    add_column :events, :longitude, :decimal, :precision => 15, :scale => 13
  end
end
