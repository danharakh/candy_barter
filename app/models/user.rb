class User < ApplicationRecord
  # Direct associations

  has_many   :comments

  has_many   :received_proposals,
             :class_name => "ProposedTrade",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_proposals,
             :class_name => "ProposedTrade",
             :foreign_key => "proposer_id",
             :dependent => :destroy

  has_many   :inventories,
             :dependent => :destroy

  has_many   :memberships,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :username, :presence => true, :uniqueness => true

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  validates :zipcode, :numericality => { :greater_than => 0, :less_than_or_equal_to => 99999 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
