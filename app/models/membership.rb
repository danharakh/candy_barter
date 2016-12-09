class Membership < ApplicationRecord
  # Direct associations

  belongs_to :organization

  belongs_to :user

  # Indirect associations

  # Validations
  validates :user_id, :uniqueness => { :scope => [:organization_id] }
end
