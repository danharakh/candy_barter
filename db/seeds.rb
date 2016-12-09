# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
organizations_info =
  {
    :name => "University of Chicago",
    :description => "Where fun comes to die"
  }

Organization.create organizations_info

puts "There are now #{Organization.count} organizations in the database."


names = ["alice smith", "bob doe", "carol johnson"]

names.each do |name|
  name = name.scan(/\w+/)
  user = User.create
  user.email = "#{name[0]}@example.com"
  user.password = "12341234"
  user.zipcode = '12345'
  user.first_name = name[0]
  user.last_name = name[1]
  user.save
end

puts "There are now #{User.count} users in the database."

items_info = [
  {
    :name => "Snickers Bar",
    :descriptive_information => "fun size"
  },
  {
    :name => "Almond Joy",
    :descriptive_information => "fun size.  Tastes so bad."
  },
  {
    :name => "Skittles",
    :descriptive_information => "small bag"
  },
  {
    :name => "Butterfinger",
    :descriptive_information => "Regular size candy bar!"
  },
  {
    :name => "Tootsie Roll",
    :descriptive_information => "small size"
  },
  {
    :name => "Smarties",
    :descriptive_information => "roll of chalk pieces"
  },
  {
    :name => "Snickers",
    :descriptive_information => "bite size"
  },
  {
    :name => "Three Musketeers",
    :descriptive_information => "King Size"
  },
  {
    :name => "Thin Mints",
    :descriptive_information => "3 oz package"
  },
  {
    :name => "Haagen Dazs Ice Cream",
    :descriptive_information => "Banana Flavor, 12 oz package, fully melted"
  },
  {
    :name => "Purple Stuff",
    :descriptive_information => "not Sunny-D"
  }]

Item.create items_info

puts "There are now #{Item.count} items in the database."

items = Item.all
users = User.all
organizations = Organization.all

users.each do |user|

  membership = user.memberships.build
  # membership.user_id = user.id
  membership.organization_id = organizations.sample.id
  membership.save

  [3,4,5].sample.times do
    inventory = user.inventories.build
    inventory.item_id = items.sample.id
    # inventory.user_id = user.id
    inventory.quantity = [rand(5), 1].max
    inventory.save
  end

  [3,4,5].sample.times do
    proposed_trade = user.sent_proposals.build
    proposed_trade.status = ["Pending","Rejected","Accepted"].sample
    # proposed_trade.proposer_id = user.id
    loop do
      proposed_trade.recipient_id = users.sample.id
      break if proposed_trade.recipient_id != user.id
    end
    proposed_trade.save
  end

end

puts "There are now #{Membership.count} memberships in the database."
puts "There are now #{Inventory.count} inventories in the database."
puts "There are now #{ProposedTrade.count} proposed trades in the database."

proposed_trades = ProposedTrade.all

proposed_trades.each do |proposed_trade|
  [1,2,3].sample.times do
    next if [1,2,3,4,5].sample == 1
    comment = proposed_trade.comments.build
    # comment.proposed_trade_id = proposed_trade.id
    comment.user_id = [proposed_trade.proposer_id,    proposed_trade.recipient_id].sample
    comment.body = ["Sounds ok",
      "Are you sure?",
      "I don't know if you can do any better",
      "Really?!?!?!?!",
      "What's up bro/sis?",
      "This is not for reals"
    ].sample
    comment.save
  end

  line_item_1 = proposed_trade.line_items.build
  line_item_1.inventory_id = proposed_trade.proposer.inventories.sample.id
  line_item_1.quantity = "1"
  line_item_1.save

  line_item_2 = proposed_trade.line_items.build
  line_item_2.inventory_id = proposed_trade.recipient.inventories.sample.id
  line_item_2.quantity = "1"
  line_item_2.save

end

puts "There are now #{Comment.count} comments in the database."
puts "There are now #{LineItem.count} line items in the database."
