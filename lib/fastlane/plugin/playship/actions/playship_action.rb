module Fastlane
  module Actions
    class PlayshipAction < Action
      def self.run(params)
        Fastlane::Playship::Client.new(params[:key])
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
