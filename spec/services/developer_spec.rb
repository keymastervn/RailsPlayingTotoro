require 'rails_helper'

# Test suite for the Developer service
RSpec.describe DeveloperService do

  # Factorying
  let!(:first_developer) { FactoryBot.create(:developer, email: 'a') }
  let!(:second_developer) { FactoryBot.create(:developer, email: 'b') }
  let!(:third_developer) { FactoryBot.create(:developer, email: 'c') }
  let!(:jp_language) { FactoryBot.create(:language, code: 'jp') }
  let!(:vn_language) { FactoryBot.create(:language, code: 'vn') }
  let!(:en_language) { FactoryBot.create(:language, code: 'en') }
  let!(:ruby_programming_language) { FactoryBot.create(:programming_language, name: 'ruby') }
  let!(:java_programming_language) { FactoryBot.create(:programming_language, name: 'java') }
  let!(:golang_programming_language) { FactoryBot.create(:programming_language, name: 'golang') }

  # Unit test
  describe '#search' do
    before {
      first_developer.languages << vn_language
      first_developer.languages << en_language
      first_developer.languages << jp_language

      second_developer.languages << jp_language

      first_developer.programming_languages << ruby_programming_language
      first_developer.programming_languages << java_programming_language
      second_developer.programming_languages << ruby_programming_language
      second_developer.programming_languages << golang_programming_language
    }

    context 'when search only one term' do
      before {
        params = {:languages => 'vn'}
        @service = DeveloperService.new(params)
      }

      it { expect(@service.search).to include(first_developer)}
      it { expect(@service.search).not_to include(second_developer)}
    end

    context 'when search one type with 2 terms' do
      before {
        params = {:programming_langs => 'ruby,java'}
        @service = DeveloperService.new(params)
      }

      it { expect(@service.search).to include(first_developer)}
      it { expect(@service.search).not_to include(second_developer)}
    end

    context 'when search with combined terms and types' do
      before {
        params = {:languages => 'jp', :programming_langs => 'ruby'}
        @service = DeveloperService.new(params)
      }

      it { expect(@service.search).to include(first_developer)}
      it { expect(@service.search).to include(second_developer)}
      it { expect(@service.search).not_to include(third_developer)}
    end
  end
end