class Comment < ApplicationRecord
  # Direct associations

  belongs_to :proposed_trade

  belongs_to :user

  # Indirect associations

  # Validations

end
