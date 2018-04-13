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

class Item < ApplicationRecord
  belongs_to :cart
end
