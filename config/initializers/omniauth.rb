Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
    provider :facebook, '355856628715613', 'ba5d4c6c5acd642ef26a7ad0c4130a7a'
  end