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
  end
end

