# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
organizations_info = [
  {
    :name => "University of Chicago",
    :descriptive_information => "Where fun comes to die"
  },

Organization.create organizations_info



names = ["alice smith", "bob doe", "carol johnson"]

names.each do |name|
  name = name.scan(/\w+/)
  user = User.create
  user.email = "#{name[1]}@example.com"
  user.password = "12341234"
  user.zipcode = '12345'
  user.first_name = name[1]
  user.last_name = name[2]
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
  }

Items.create items_info

items = Itemss.all
users = User.all
organizations = Organization.all

users.each do |user|

  membership = user.membership.build
  membership.user_id = user.id
  membership.organization_id = organizations.sample.id
  membership.save

  rand(3).times do
    inventory = user.inventory.build
    inventory.item_id = items.sample.id
    inventory.user_id = user.id
    inventory.quantity = [rand(5), 1].min
    inventory.save
  end

  rand(5).times do
    proposed_trade = user.proposed_trade.build
    proposed_trade.status = ["Pending","Rejected","Accepted"].sample
    proposed_trade.proposer_id = user.user_id
    proposed_trade.recipient_id = users.sample.id
    if proposed_trade.recipient_id = user.user_id || proposed_trade.recipient_id != 1
      proposed_trade.recipient_id = proposed_trade.recipient_id - 1
    else
      proposed_trade.recipient_id = 1
    end
    proposed_trade.save
  end

end

proposed_trades = Proposed_trades.all

proposed_trades.each do |proposed_trade|
  rand(4).times do
    next if [1,2].sample == 1
    comment = proposed_trade.comment.build
    comment.proposed_trade_id = proposed_trade.idea
    comment.user_id = [proposed_trade.proposer_id,    proposed_trade.recipient_id].sample
    body = ["Sounds ok",
      "Are you sure?",
      "I don't know if you can do any better",
      "Really?!?!?!?!",
      "What's up bro/sis?"
      "This is not for reals"
    ].sample
  end
end

end
