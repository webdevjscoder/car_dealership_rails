Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
    provider :facebook, '355856628715613', 'd8a6f8a4c9203940c629d8b3449a1855'
  end