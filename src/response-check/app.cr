require "http/client"
require "./config"

module Response::Check
  class App
    def self.check_response
      site_url = Config.get(:site_url)
      trigger_path = Config.get(:trigger_path)
      response = HTTP::Client.get(site_url)

      if response.success?
        if File.symlink?(trigger_path)
          FileUtils.rm(trigger_path)
        elsif File.exists?(trigger_path)
          Log.error { "#{trigger_path} is not a symlink, ignoring it for safety reasons" }
          exit 1
        end
      else
        Log.error { "Request to #{site_url} returned #{response.status_code}" }

        FileUtils.rm(trigger_path) if File.symlink?(trigger_path)
        FileUtils.ln_s(
          Config.get(:template_path),
          trigger_path
        )
      end
    end
  end
end
