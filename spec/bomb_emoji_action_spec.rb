describe Fastlane::Actions::BombEmojiAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The bomb_emoji plugin is working!")

      Fastlane::Actions::BombEmojiAction.run(nil)
    end
  end
end
