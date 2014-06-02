require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Portfolio
  class Application < Rails::Application
    config.i18n.enforce_available_locales = false

    config.secret_key_base = 'faulkenberry-portfolio'

    config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')

    config.assets.precompile += ["codemirror*", "codemirror/**/*"]

    config.generators do |g|
      g.test_framework :mini_test, :spec => true
      g.fixture_replacement :factory_girl
    end

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
    
    config.action_mailer.delivery_method = :postmark
    config.action_mailer.postmark_settings = { :api_key => ENV["POSTMARK_API_KEY"] }
    
    CarrierWave.configure do |config|
      config.fog_credentials = {
        :provider               => 'AWS',
        :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],
        :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],
        :region                 => ENV['AWS_REGION'],
        :host                   => ENV['S3_HOST'],
        :endpoint               => ENV['S3_ENDPOINT']
      }
      config.fog_directory  = ENV['S3_FOG_DIR']
      config.fog_public     = false
      config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
    end
  end
end

