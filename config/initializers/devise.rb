Devise.setup do |config|
  config.secret_key = '3ff1fb03ab7f8676de41846a5881d73d1793d11d8f8b1edf82feeaec376f5aade2714c5041208ad753620052d1b0a01989a7ecf0cbfd8e85e6186ce7f515aed2'
  
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.password_length = 8..128

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete
  
  config.omniauth :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], :scope => 'user'
end
