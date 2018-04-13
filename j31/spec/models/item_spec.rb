# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  price       :decimal(10, 2)
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cart_id     :integer
#

require 'rails_helper'

RSpec.describe Item, type: :model do 
	it "should exist" do
		expect(Item.new).to be_valid
	end
end
