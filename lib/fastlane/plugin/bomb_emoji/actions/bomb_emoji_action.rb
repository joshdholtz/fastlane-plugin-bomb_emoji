require 'fastlane/action'
require_relative '../helper/bomb_emoji_helper'

module Fastlane
  module Actions
    class BombEmojiAction < Action

      def self.run(params)
        UI.message "💣💥 Bombing all emojis" if params[:enabled]
        ENV['BOMB_EMOJI_ENABLED'] = params[:enabled] ? 'true' : nil
        UI.message "💣💥 Un-bombing all emojis" unless params[:enabled]
      end

      def self.description
        "No more emojis"
      end

      def self.authors
        ["joshdholtz"]
      end

      def self.details
        "No more emojis"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :enabled,
                                  env_name: "BOMB_EMOJI_ENABLED",
                               description: "Bomb all emoji from showing",
                             default_value: true,
                                      type: Boolean)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
