$stdout.sync = true

Rails.application.config do |config|
  config.logger = Logger.new($stdout)
end
