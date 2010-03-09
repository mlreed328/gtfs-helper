# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100308044709) do

  create_table "calendars", :id => false, :force => true do |t|
    t.string  "service_id"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.boolean "sunday"
    t.string  "start_date"
    t.string  "end_date"
  end

  create_table "routes", :id => false, :force => true do |t|
    t.string  "route_id"
    t.integer "agency_id"
    t.string  "route_short_name"
    t.string  "route_long_name"
    t.string  "route_desc"
    t.string  "route_type"
    t.string  "route_url"
  end

  create_table "stop_times", :id => false, :force => true do |t|
    t.string  "trip_id"
    t.string  "arrival_time"
    t.string  "departure_time"
    t.integer "stop_id"
    t.integer "stop_sequence"
    t.integer "pickup_type"
    t.integer "drop_off_type"
  end

  create_table "stops", :id => false, :force => true do |t|
    t.string  "stop_id"
    t.string  "stop_name"
    t.string  "stop_description"
    t.decimal "stop_lat",         :precision => 15, :scale => 9, :null => false
    t.decimal "stop_lon",         :precision => 15, :scale => 9, :null => false
    t.string  "stop_street"
    t.string  "stop_city"
    t.string  "stop_region"
    t.string  "stop_postcode"
    t.string  "stop_country"
  end

  create_table "trips", :id => false, :force => true do |t|
    t.string  "route_id"
    t.string  "service_id"
    t.string  "trip_id"
    t.string  "trip_headsign"
    t.integer "block_id"
    t.integer "shape_id"
  end

  create_table "uploads", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
  end

end
