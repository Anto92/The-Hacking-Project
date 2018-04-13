require 'rails_helper'

RSpec.describe Board, type: :model do
  it "Board is a table (a class)" do
    expect(Board).to be_a(Class)
  end
end
