module Fastlane
  module Playship
    class Client
      Androidpublisher = Google::Apis::AndroidpublisherV3
      CredentialsLoader = Google::Auth::CredentialsLoader
      # Raw Client access
      attr_accessor :client
      def initialize(key)
        scope = Androidpublisher::AUTH_ANDROIDPUBLISHER
        # requires valid play store json key
        service_account_json = File.open(File.expand_path(key))
        auth_client = Google::Auth::ServiceAccountCredentials.make_creds(json_key_io: service_account_json, scope: scope)
        auth_client.fetch_access_token!

        Google::Apis::ClientOptions.default.application_name = "fastlane-playship"
        Google::Apis::ClientOptions.default.application_version = "1.0"
        #Google::Apis::ClientOptions.default.read_timeout_sec = 300
        #Google::Apis::ClientOptions.default.open_timeout_sec = 300
        Google::Apis::RequestOptions.default.retries = 5

        android_publisher = Androidpublisher::AndroidPublisherService.new
        android_publisher.authorization = auth_client
        @client = android_publisher
        android_publisher
      end
      # TODO: add convienent methods :)
    end
  end
end
