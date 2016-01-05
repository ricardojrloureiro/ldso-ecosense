categories_list = [
    [ "Eco Sustainability"],
    [ "Resources" ],
    [ "Awareness" ],
    [ "Social Responsibility" ]
]

categories_list.each do |category|
  Category.create(:name => category[0])
end

user = User.new
user.name = "Admin"
user.email = "admin@admin.com"
user.password = "123123"
user.admin = 1
user.save