categories_list = [
    [ "Category 1"],
    [ "Category 2" ],
    [ "Category 3" ],
    [ "Category 4" ]
]

categories_list.each do |category|
  Category.create(:name => category[0])
end