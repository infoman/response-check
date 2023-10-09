require "yaml"
require "file_utils"

module Response::Check
  class Config
    @@config = YAML::Any.new(nil)

    def self.get(value : Symbol) : String
      @@config = load_config if @@config.as_h?.nil? || @@config.as_h.empty?

      @@config[value.to_s].as_s
    end

    private def self.self_dir_path : String
      path = Process.executable_path
      if path.nil?
        "."
      else
        File.dirname(path)
      end
    end

    private def self.load_config : YAML::Any
      File.open("#{self_dir_path}/config.yml") do |file|
        YAML.parse(file)
      end
    end
  end
end
