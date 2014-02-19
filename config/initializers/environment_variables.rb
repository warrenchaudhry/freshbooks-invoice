if Rails.env == "production"
  # set credentials from ENV hash
  FRESHBOOKS = { :account_url => ENV['ACCOUNT_URL'], :auth_token => ENV['AUTH_TOKEN']}
else
  # get credentials from YML file

  env_file = Rails.root.join("config", 'env.yml').to_s
  if File.exists?(env_file)
    YAML.load_file(env_file)[Rails.env].each do |key, value|
      ENV[key.to_s] = value
    end # end YAML.load_file
  end # end if File.exists?
  FRESHBOOKS = { :account_url => ENV['ACCOUNT_URL'], :auth_token => ENV['AUTH_TOKEN']}
  
end
