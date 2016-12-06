class Membership < ApplicationRecord
  # Direct associations

  belongs_to :organization

  belongs_to :user

  # Indirect associations

  # Validations

end
