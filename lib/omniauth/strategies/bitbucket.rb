require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class BitBucket < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://bitbucket.org',
        :authorize_url => '/site/oauth2/authorize',
        :token_url => '/site/oauth2/access_token'
      }

      uid { raw_info['uuid'] }

      def callback_url
        nil
      end

      info do
        {
          'nickname' => raw_info['username'],
          'name' => raw_info['display_name']
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        if @raw_info.nil?
          @raw_info = (access_token.get('/api/2.0/user').parsed)
        end
        return @raw_info
      end
    end
  end
end

OmniAuth.config.add_camelization 'bitbucket', 'BitBucket'
