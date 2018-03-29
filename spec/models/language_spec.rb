require 'rails_helper'

# Test suite for the Language model
RSpec.describe Language, type: :model do
  # Association test
  it { should have_and_belong_to_many(:developers) }

  # Validation tests
  it { should validate_presence_of(:code)}
end