require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class GitHub < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://api.github.com',
        :authorize_url => 'https://github.com/login/oauth/authorize',
        :token_url => 'https://github.com/login/oauth/access_token'
      }

      def request_phase
        super
      end

      uid { raw_info['id'] }

      info do
        {
          'nickname' => raw_info['login'],
          'email' => raw_info['email'],
          'name' => raw_info['name']
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        if @raw_info.nil?
          @raw_info = access_token.get('/user').parsed
        end
        return @raw_info
      end
    end
  end
end

OmniAuth.config.add_camelization 'github', 'GitHub'
