class ProposedTrade < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  has_many   :line_items,
             :dependent => :destroy

  has_many   :inventories,
             :dependent => :destroy

  belongs_to :recipient,
             :class_name => "User"

  belongs_to :proposer,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :star_rating, :inclusion => { :in => [ '1', '2', '3', '4', '5' ]  }

end
