require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class AdobeId < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://ims-na1.adobelogin.com/ims/profile/v1',
        :authorize_url => 'https://ims-na1.adobelogin.com/ims/authorize/v1',
        :token_url => 'https://ims-na1.adobelogin.com/ims/token/v1'
      }
      option :provider_ignores_state, true

      def request_phase
        options[:authorize_params].merge!(:locale => I18n.locale)
        super
      end

      uid { raw_info['userId'] }

      info do
        {
          'nickname' => raw_info['email'],
          'email' => raw_info['email'],
          'name' => raw_info['name'],
          'service_accounts' => raw_info['serviceAccounts'],
          'country_code' => raw_info['countryCode'],
          'email_verified' => raw_info['emailVerified']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'adobeid', 'AdobeId'
