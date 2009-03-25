# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_GitApp_session',
  :secret      => '6b838832581eb238c2c160e70b8f0b62ad2ed8a9a61524d0837e08a15525bf10f8ea4dd39c079dddfb60528292492e9b8cb0ac2a9f7668df214cbfe3fb83a50d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
