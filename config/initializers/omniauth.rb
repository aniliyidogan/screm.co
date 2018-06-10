Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    Rails.application.credentials.dig(:omniauth, :google, :client_id),
    Rails.application.credentials.dig(:omniauth, :google, :client_secret)
end
