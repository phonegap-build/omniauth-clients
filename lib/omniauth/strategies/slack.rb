require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Slack < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://slack.com',
        :authorize_url => '/oauth/authorize',
        :token_url => '/api/oauth.access'
      }

      option :redirect_url

      uid { "#{info['team_id']}.#{info['user_id']}" }

      def callback_url
        nil
      end

      info do
        access_token.params
      end

      private

      def callback_url
        options.redirect_url || (full_host + script_name + callback_path)
      end

    end
  end
end

OmniAuth.config.add_camelization 'slack', 'Slack'
