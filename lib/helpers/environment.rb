module Environment
  def yaml
    require 'yaml'
    environment = ENV['NANOC_ENV'] || 'development'
    path = File.join(File.expand_path(File.dirname(__FILE__)), "..", "..", ".env.#{environment}.yml")
    YAML::load_file(path)
  end

  def env(key:)
    yaml[key]
  end
end
