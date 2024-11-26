require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)

module HotelResarvation
  class Application < Rails::Application
    config.load_defaults 6.1
    config.before_configuration do
      database_config = YAML.safe_load(
        ERB.new(File.read(Rails.root.join("config", "database.yml"))).result,
        aliases: true
      )
      ActiveRecord::Base.configurations = database_config
    end  
    
    config.i18n.default_locale = :ja
    config.assets.enabled = true
    
  end
end