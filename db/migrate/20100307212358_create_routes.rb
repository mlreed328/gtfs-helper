class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes, :id => false do |t|
      t.string :route_id
      t.integer :agency_id
      t.string :route_short_name
      t.string :route_long_name
      t.string :route_desc
      t.string :route_type
      t.string :route_url
    end
  end

  def self.down
    drop_table :routes
  end
end