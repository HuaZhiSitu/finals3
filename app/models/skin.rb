# == Schema Information
#
# Table name: skins
#
#  id             :bigint           not null, primary key
#  description    :text
#  image_url      :string
#  name           :string
#  starting_price :decimal(, )
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Skin < ApplicationRecord
  validates :name, :description, :starting_price, presence: true

  has_many :bids, dependent: :destroy

  def highest_bid
    bids.order(amount: :desc).first&.amount || 0
  end
end
