require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class GitHubApp < GitHub
    end
  end
end

OmniAuth.config.add_camelization 'githubapp', 'GitHubApp'
