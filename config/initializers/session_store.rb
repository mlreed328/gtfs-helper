# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gtfs-helper_session',
  :secret      => '8076c77a26130144c5ec406d0d16da335ced4ca4a0d8752c3ba723d362d5fe7909a8423c647d4bd1935e121ce2363ac960df57e3b83e0b0281d4cf7ac74ea640'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
