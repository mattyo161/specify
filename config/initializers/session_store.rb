# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_template_editor_session',
  :secret      => 'fb6f64fe5aac49844c7264938c770a8890dd1afb378af8513729d60973d2065f3d62c536b1334df2b95ce7a3f6bb7051e807bb2de3ec8cb9ee1a2f553c9f3769'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
