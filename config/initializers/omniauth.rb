Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['facebook_client_id'], ENV['github_client_secret']
  end