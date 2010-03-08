namespace :gtfs do
  namespace :import do
    
    desc "Import Trips"
    task :trips => :environment do
      Trip.delete_all if Trip.all.any?
      print "Importing Trip records..."
      rows = FasterCSV.read("#{RAILS_ROOT}/tmp/gtfs/trips.txt")
      rows[1..rows.length].each do |column|
        trip = Trip.new
        trip.route_id = column[0]
        trip.service_id = column[1]
        trip.trip_id = column[2]
        trip.trip_headsign = column[3]
        trip.block_id = column[4]
        trip.shape_id = column[5]
        trip.save!
      end
      puts "#{Trip.count} imported."
    end
    
    desc "Import Routes"
    task :routes => :environment do
      Route.delete_all if Route.all.any?
      print "Importing Route records..."
      rows = FasterCSV.read("#{RAILS_ROOT}/tmp/gtfs/routes.txt")
      rows[1..rows.length].each do |column|
        route = Route.new
        route.route_id = column[0]
        route.agency_id = column[1]
        route.route_short_name = column[2]
        route.route_long_name = column[3]
        route.route_desc = column[4]
        route.route_type = column[5]
        route.route_url = column[6]
        route.save!
      end
      puts "#{Route.count} imported."
    end
    
    desc "Import StopTimes"
    task :stop_times => :environment do
      StopTime.delete_all if StopTime.all.any?
      print "Importing StopTime records..."
      rows = FasterCSV.read("#{RAILS_ROOT}/tmp/gtfs/stop_times.txt")
      rows[1..rows.length].each do |column|
        stop_time = StopTime.new
        stop_time.trip_id = column[0]
        stop_time.arrival_time = column[1]
        stop_time.departure_time = column[2]
        stop_time.stop_id = column[3]
        stop_time.stop_sequence = column[4]
        stop_time.pickup_type = column[5]
        stop_time.save!
      end
      puts "#{StopTime.count} imported."
    end
    
    desc "Import Stops"
    task :stops => :environment do
      Stop.delete_all if Stop.all.any?
      print "Importing Stop records..."
      rows = FasterCSV.read("#{RAILS_ROOT}/tmp/gtfs/stops.txt")
      rows[1..rows.length].each do |column|
        stop = Stop.new
        stop.stop_id = column[0]
        stop.stop_name = column[1]
        stop.stop_description = column[2]
        stop.stop_lat = column[3]
        stop.stop_lon = column[4]
        stop.stop_street = column[5]
        stop.stop_city = column[6]
        stop.stop_region = column[7]
        stop.stop_postcode = column[8]
        stop.stop_country = column[9]
        stop.save!
      end
      puts "#{Stop.count} imported."
    end
    
    desc "Import Calendars"
    task :calendars => :environment do
      Calendar.delete_all if Calendar.all.any?
      print "Importing Calendar records..."
      calendars = FasterCSV.read("#{RAILS_ROOT}/tmp/gtfs/calendar.txt")
      calendars[1..calendars.length].each do |column|
        calendar = Calendar.new
        calendar.service_id = column[0]
        calendar.monday = column[1]
        calendar.tuesday = column[2]
        calendar.wednesday = column[3]
        calendar.thursday = column[4]
        calendar.friday = column[5]
        calendar.saturday = column[6]
        calendar.sunday = column[7]
        calendar.start_date = column[8]
        calendar.end_date = column[9]
        calendar.save!
      end
      puts "#{Calendar.count} imported."
    end

    desc "Import records for all models"
    task :all => [ "gtfs:import:trips", "gtfs:import:routes", "gtfs:import:stop_times", "gtfs:import:stops", "gtfs:import:calendars" ]
    
  end
end