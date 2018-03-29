require 'rails_helper'

# Test suite for the Developer model
RSpec.describe Developer, type: :model do
  # Association test
  it { should have_and_belong_to_many(:programming_languages) }
  it { should have_and_belong_to_many(:languages) }

  # Validation tests
  it { should validate_presence_of(:email)}
end