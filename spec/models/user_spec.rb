require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:company) }
  it { should have_many(:tweets) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
end
