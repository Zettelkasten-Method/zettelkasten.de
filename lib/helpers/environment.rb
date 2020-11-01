module Environment
  def self.included(base)
    require "dotenv"
    environment = (ENV['NANOC_ENV'] || 'development').downcase
    path = File.join(File.expand_path(File.dirname(__FILE__)), "..", "..", ".env.#{environment}")
    puts path
    Dotenv.load(path)
  end
end
