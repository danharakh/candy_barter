class Item < ApplicationRecord
  # Direct associations

  has_many   :inventories,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:descriptive_information] }

  validates :name, :presence => true

end
