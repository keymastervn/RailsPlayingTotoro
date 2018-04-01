require 'rails_helper'

# Test suite for the Developer service
RSpec.describe DeveloperService do

  # Factorying
  let!(:first_developer) { FactoryBot.create(:developer, id: 1, email: 'a') }
  let!(:second_developer) { FactoryBot.create(:developer, id: 2, email: 'b') }
  let!(:third_developer) { FactoryBot.create(:developer, id: 3, email: 'c') }
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
        @dev = @service.all_dev
      }

      it { expect(@service.search(@dev)).to include(first_developer)}
      it { expect(@service.search(@dev)).not_to include(second_developer)}
    end

    context 'when search one type with 2 terms' do
      before {
        params = {:programming_langs => 'ruby,java'}
        @service = DeveloperService.new(params)
        @dev = @service.all_dev
      }

      it { expect(@service.search(@dev)).to include(first_developer)}
      it { expect(@service.search(@dev)).not_to include(second_developer)}
    end

    context 'when search with combined terms and types' do
      before {
        params = {:languages => 'jp', :programming_langs => 'ruby'}
        @service = DeveloperService.new(params)
        @dev = @service.all_dev
      }

      it { expect(@service.search(@dev)).to include(first_developer)}
      it { expect(@service.search(@dev)).to include(second_developer)}
      it { expect(@service.search(@dev)).not_to include(third_developer)}
    end
  end

  describe '#some_dev' do
    before {
      params = {:id => '1,2'}
      @service = DeveloperService.new(params)
      @dev = @service.some_dev
    }

    it { expect(@dev).to include(first_developer) }
    it { expect(@dev).to include(second_developer) }
    it { expect(@dev).not_to include(third_developer) }
  end
end