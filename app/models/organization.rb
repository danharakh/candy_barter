class Organization < ApplicationRecord
  # Direct associations

  has_many   :memberships,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:description] }

  validates :name, :presence => true

end
