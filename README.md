# OmniAuth AdobeId

This is the OmniAuth strategies for all clients authenticating for phonegapbuild.

## Basic Usage

    use OmniAuth::Builder do
      provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
    end
