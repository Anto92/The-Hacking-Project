require 'rails_helper'

RSpec.describe ArchivedBoard, type: :model do
  it "archived_boards is a table (a class)" do
    expect(ArchivedBoard).to be_a(Class)
  end
end
