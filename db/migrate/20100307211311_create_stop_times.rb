class CreateStopTimes < ActiveRecord::Migration
  def self.up
    create_table :stop_times, :id => false do |t|
      t.string :trip_id
      t.string :arrival_time
      t.string :departure_time
      t.integer :stop_id
      t.integer :stop_sequence
      t.integer :pickup_type
      t.integer :drop_off_type
    end
  end

  def self.down
    drop_table :stop_times
  end
end
