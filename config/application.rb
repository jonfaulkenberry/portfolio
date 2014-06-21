require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(:default, Rails.env)

module Portfolio
  class Application < Rails::Application
    config.i18n.enforce_available_locales = false

    config.secret_key_base = 'faulkenberry-portfolio'
    
    config.assets.paths << "#{Rails.root}/vendor/assets/**/*"
    
    config.assets.precompile += ["codemirror*", "codemirror/**/*"]
    config.assets.precompile << /\.(?:png|gif|jpg|jpeg)$/
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/

    config.generators do |g|
      g.test_framework :mini_test, :spec => true
      g.fixture_replacement :factory_girl
    end
    
    config.action_mailer.delivery_method = :postmark
    config.action_mailer.postmark_settings = { :api_key => ENV["POSTMARK_API_KEY"] }
    
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
    
      config.assets.digest = true
  end
end

