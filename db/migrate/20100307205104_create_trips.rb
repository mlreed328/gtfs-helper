class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips, :id => false do |t|
      t.string :route_id
      t.string :service_id
      t.string :trip_id
      t.string :trip_headsign
      t.integer :block_id
      t.integer :shape_id
    end
  end

  def self.down
    drop_table :trips
  end
end