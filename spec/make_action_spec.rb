describe Fastlane::Actions::MakeAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The make plugin is working!")

      Fastlane::Actions::MakeAction.run(nil)
    end
  end
end
