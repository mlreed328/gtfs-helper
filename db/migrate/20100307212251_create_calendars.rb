class CreateCalendars < ActiveRecord::Migration
  def self.up
    create_table :calendars, :id => false do |t|
      t.string :service_id
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.string :start_date
      t.string :end_date
    end
  end

  def self.down
    drop_table :calendars
  end
end
