require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'for validation for attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:comment) }
    it { should_not validate_presence_of(:email) }
  end
end

