require "./**"

module Response::Check
  VERSION = "0.1.0"
end

Log.setup_from_env(default_level: :info)
Response::Check::App.check_response
