require 'fastlane/plugin/playship/version'
require 'googleauth'
require 'google/apis/androidpublisher_v3'
require 'fastlane/plugin/playship/client'

module Fastlane
  module Playship
    def self.all_classes
      Dir[File.expand_path('**/{actions,helper}/*.rb', File.dirname(__FILE__))]
    end
  end
end

Fastlane::Playship.all_classes.each do |current|
  require current
end
