require 'rails_helper'

# Test suite for the ProgrammingLanguage service
RSpec.describe ProgrammingLanguageService do
  let!(:first_developer) { FactoryBot.create(:developer, email: 'a') }

  let!(:ruby_programming_language) { FactoryBot.create(:programming_language, name: 'ruby') }
  let!(:java_programming_language) { FactoryBot.create(:programming_language, name: 'java') }

  # Unit test
  describe '#not_used' do
    before {
      first_developer.programming_languages << ruby_programming_language
    }
    context 'should contains not used languages' do
      it { expect(ProgrammingLanguageService.not_used).to include(java_programming_language) }
    end
  end

end