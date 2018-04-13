# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_carts_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Cart, type: :model do
  context "Cart association" do
    it "should exist" do
      # expect(Cart.new).to be_valid
    end
  end
end
