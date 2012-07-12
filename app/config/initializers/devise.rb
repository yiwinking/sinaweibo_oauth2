SERVICES = YAML.load_file(Rails.root.join("config", "services.yml")).fetch(Rails.env)
Devise.setup do |config|
  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  config.omniauth :weibo, SERVICES['weibo']['api_key'], SERVICES['weibo']['api_secret']
end
