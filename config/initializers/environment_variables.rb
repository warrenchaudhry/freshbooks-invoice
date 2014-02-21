if Rails.env == "production"
  # set credentials from ENV hash
  APP_VARS = { :account_url => ENV['ACCOUNT_URL'], :auth_token => ENV['AUTH_TOKEN'], :ws_token => ENV['WS_TOKEN']}
else
  # get credentials from YML file

  env_file = Rails.root.join("config", 'env.yml').to_s
  if File.exists?(env_file)
    YAML.load_file(env_file)[Rails.env].each do |key, value|
      ENV[key.to_s] = value
    end # end YAML.load_file
  end # end if File.exists?
  APP_VARS = { :account_url => ENV['ACCOUNT_URL'], :auth_token => ENV['AUTH_TOKEN'], :ws_token => ENV['WS_TOKEN']}
  
end
