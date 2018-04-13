require 'rails_helper'

RSpec.describe Match, type: :model do
  it "Match is a table (a class)" do
    expect(Match).to be_a(Class)
  end
end
