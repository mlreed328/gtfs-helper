class CreateStops < ActiveRecord::Migration
  def self.up
    create_table :stops, :id => false do |t|
      t.string :stop_id
      t.string :stop_name
      t.string :stop_description
      t.decimal :stop_lat, :precision => 15, :scale => 9, :null => false
      t.decimal :stop_lon, :precision => 15, :scale => 9, :null => false
      t.string :stop_street
      t.string :stop_city
      t.string :stop_region
      t.string :stop_postcode
      t.string :stop_country
    end
  end

  def self.down
    drop_table :stops
  end
end
