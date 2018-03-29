require 'rails_helper'

# Test suite for the ProgrammingLanguage model
RSpec.describe ProgrammingLanguage, type: :model do
  # Association test
  it { should have_and_belong_to_many(:developers) }

  # Validation tests
  it { should validate_presence_of(:name)}
end