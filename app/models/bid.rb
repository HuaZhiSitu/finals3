# == Schema Information
#
# Table name: bids
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  skin_id    :integer
#  user_id    :integer
#
class Bid < ApplicationRecord
  validates :amount,presence: true, numericality:{greater_than: 0}
  validates :user_id, :skin_id, presence: true
  validate :amount_must_be_greater_than_current_maximum
  belongs_to :user
  belongs_to :skin
    # Scopes (Optional)
  scope :highest_bid, -> { order(amount: :desc).first }
  scope :bids_for_skin, ->(skin_id) { where(skin_id: skin_id) }

  private

  def amount_must_be_greater_than_current_maximum
    if skin.present?
      current_max = skin.bids.maximum(:amount) || skin.starting_price
      if amount <= current_max
        errors.add(:amount, "must be greater than the current maximum bid ($#{current_max})")
      end
    end
  end

end
