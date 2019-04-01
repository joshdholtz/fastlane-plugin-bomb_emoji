require 'fastlane_core/ui/ui'
require 'emoji_regex'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class BombEmojiHelper
      @@emojis_removed = 0
      @@emoji_lines_cleaned = []

      def self.bomb(arg)
        # Only bomb if we want to bomb
        return arg unless ENV['BOMB_EMOJI_ENABLED']

        # Don't bomb a table
        return arg if arg.kind_of?(Terminal::Table)

        # Only bomb a string
        return arg unless arg.kind_of?(String)

        # Don't bomb a separator
        return arg if arg.start_with?("---")

        # Bomb the rest
        clean = arg.to_s.gsub(EmojiRegex::Regex, "").to_s

        count = arg.to_s.size - clean.size
        @@emojis_removed += count
        @@emoji_lines_cleaned << arg if count > 0

        if clean.start_with?("fastlane.tools finished successfully") || clean.start_with?("fastlane.tools just saved you") || clean.start_with?("fastlane finished with errors")
          clean += "\nfastlane-plugin-bomb_emoji saved you #{@@emojis_removed} emoji"
          @@emoji_lines_cleaned.each do |line|
            clean += "\n\t#{line}"
          end if FastlaneCore::Globals.verbose?
        end

        return clean
      end

      module Shell
        def error(arg)
          super(BombEmojiHelper.bomb(arg))
        end
        def important(arg)
          super(BombEmojiHelper.bomb(arg))
        end
        def success(arg)
          super(BombEmojiHelper.bomb(arg))
        end
        def message(arg)
          super(BombEmojiHelper.bomb(arg))
        end
        def deprecated(arg)
          super(BombEmojiHelper.bomb(arg))
        end
        def verbose(arg)
          super(BombEmojiHelper.bomb(arg))
        end
      end
    end
  end
end

# Prep to 💣 emojis
module FastlaneCore
  class Shell
    prepend Fastlane::Helper::BombEmojiHelper::Shell
  end
end
