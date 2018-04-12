require 'rails_helper'

RSpec.describe User, type: :model do
  it "corectness user" do
  	User.create(first_name: "Anto", last_name: "test", email: "anto@anto.com")
  end

    it "duplicate user" do
  	User.create(first_name: "Anto", last_name: "test", email: "anto@anto.com")
  end
end
