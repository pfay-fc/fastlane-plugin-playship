module Fastlane
  module Actions
    class PlayshipAction < Action
      Androidpublisher = Google::Apis::AndroidpublisherV2
      CredentialsLoader = Google::Auth::CredentialsLoader
      def self.run(params)
        scope = Androidpublisher::AUTH_ANDROIDPUBLISHER
        # requires valid play store json key
        service_account_json = File.open(File.expand_path(params[:key]))
        auth_client = Google::Auth::ServiceAccountCredentials.make_creds(json_key_io: service_account_json, scope: scope)
        auth_client.fetch_access_token!

        Google::Apis::ClientOptions.default.application_name = "fastlane-playship"
        Google::Apis::ClientOptions.default.application_version = "1.0"
        Google::Apis::RequestOptions.default.timeout_sec = 300
        Google::Apis::RequestOptions.default.open_timeout_sec = 300
        Google::Apis::RequestOptions.default.retries = 5

        android_publisher = Androidpublisher::AndroidPublisherService.new
        android_publisher.authorization = auth_client
        android_publisher
      end

      def self.description
        "Playship"
      end

      def self.authors
        ["Helmut Januschka"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Returns a GooglePublisher client"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :key,
                                   env_name: "PLAYSHIP_KEY",
                                description: "AndroidPublisher JSON key",
                                   optional: false,
                                       type: String)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
