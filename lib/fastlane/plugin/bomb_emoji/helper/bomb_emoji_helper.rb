require 'fastlane_core/ui/ui'
require 'emoji_regex'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class BombEmojiHelper
      def self.bomb(arg)
        # Only bomb if we want to bomb
        return arg unless ENV['BOMB_EMOJI_ENABLED']

        # Don't bomb a table
        return arg if arg.kind_of?(Terminal::Table)

        # Don't bomb a separator
        return arg if arg.start_with?("---")

        # Bomb the rest
        return arg.to_s.gsub!(EmojiRegex::Regex, "")
      end

      module IO
        def puts(*args)
          args = args.map do |arg|
            BombEmojiHelper.bomb(arg)
          end
          super(args)
        end
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
        def command(arg)
          super(BombEmojiHelper.bomb(arg))
        end
        def command_output(arg)
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
class IO
  #prepend Fastlane::Helper::BombEmojiHelper::IO
end

# Prep to 💣 emojis
module FastlaneCore
  class Shell
    prepend Fastlane::Helper::BombEmojiHelper::Shell
  end
end