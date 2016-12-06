class LineItem < ApplicationRecord
  # Direct associations

  belongs_to :proposed_trade

  belongs_to :inventory

  # Indirect associations

  # Validations

  validates :quantity, :presence => true

  validates :quantity, :numericality => { :greater_than => 0 }

end
