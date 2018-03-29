require 'rails_helper'

# Test suite for the Developer model
RSpec.describe Developer, type: :model do
  # Association test
  it { should have_and_belong_to_many(:programming_languages) }
  it { should have_and_belong_to_many(:languages) }

  # Validation tests
  it { should validate_presence_of(:email)}

  # Factorying
  let!(:developer) { FactoryBot.create(:developer) }
  let!(:jp_language) { FactoryBot.create(:language, code: 'jp') }
  let!(:ruby_programming_language) { FactoryBot.create(:programming_language, name: 'ruby') }
  let!(:java_programming_language) { FactoryBot.create(:programming_language, name: 'java') }

  # Unit test
  describe '#can_write' do
    context 'when check a language' do
      before { developer.programming_languages << ruby_programming_language }
      it { expect(developer.can_write 'ruby').to be true }
      it { expect(developer.can_write 'rust').to be false }
    end


    context 'when check 2 languages' do
      before { developer.programming_languages << ruby_programming_language }
      before { developer.programming_languages << java_programming_language }
      it {
        expect(developer.can_write('ruby') && developer.can_write('java')).to be true
      }
    end
  end

  describe '#can_speak' do
    before { developer.languages << jp_language }
    it { expect(developer.can_speak 'jp').to be true }
  end

  describe 'both speak language and write programming language w/o conflict' do
    before { developer.programming_languages << ruby_programming_language }
    before { developer.languages << jp_language }
    it 'should be able' do
        expect(developer.can_write('ruby') && developer.can_speak('jp')).to be true
    end
  end

end