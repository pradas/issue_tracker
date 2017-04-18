OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '807982531888-mfmshgri1guhkoa8uetg8v6h9sktqbnj.apps.googleusercontent.com', 'Hj8yB1s8rWQ9dqquzd40Vz2a', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end