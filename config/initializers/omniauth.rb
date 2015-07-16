use OmniAuth::Builder do
  provider :github, ENV['github_client_id'], ENV['github_secret']
end
