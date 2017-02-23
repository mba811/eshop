# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# title_info = [
#    "得力（deli） 92621 黑马电子密码保管箱 双保险防盗 办公家用" ,
#    "飞傲 （FiiO） X5三代 便携无损音乐播放器 钛色",
#    "华硕（ASUS）RT-AC5300 5300M AC 三频千兆 低辐射 智能无线路由",
#    "大疆（DJI） 精灵3高级版-Phantom ",
#    "洛克（ROCK）双口USB充电器/头"
#  ]
#
# description_info = [
#   "",
#   "",
#   "",
#   "",
#   ""
# ]
#
# prices_info = [199.00, 200.00, 158.00, 99.00, 56.00]
#
# puts "this seed will create an admin account automatically, 10 public jobs, and 10 hidden jobs"
#
# create_account = User.create([email: "2@2.cn", password:"abcabc",password_confirmation: "abcabc",is_admin:"true"])
#
# puts "Admin account created."
#
# create_account_user = User.create([email: "1@1.com", password:"abcabc",password_confirmation: "abcabc",is_admin:"false"])
#
# puts "User account created."
#
# create_products = for i in 1..30 do
# 	title_test = title_info[rand(0..4)]
# 	description_test = title_info[rand(0..4)]
#   quantity_test = rand(8..25)
#   price_test = prices_info[rand(0..4)]
#
# 	Product.create!([title: title_test, description: description_test, quantity: quantity_test,
# 		price: price_test])
# end
#
# puts "30 Product created."



puts "Seeding......"
#
# categories = {
#    "儿童图书" => ["0-2岁", "3-6岁", "7-10岁", "11-14岁", "儿童绘本", "家庭教育"],
#    "文学艺术" => ["小说", "文学", "动漫", "传记", "艺术"],
#    "人文社科" => ["历史", "国学", "哲学", "心理学"],
#    "经济管理" => ["投资理财", "管理", "经济与金融", "市场营销"],
#    "励志成功" => ["心灵读物", "人际交往", "职场", "成功学"],
#    "科学技术" => ["科普", "计算机与网络", "医学", "建筑"],
#    "健康生活" => ["烹饪与美食", "健康与养生", "旅游与地图"]
#  }


# create_categories = for i in 1..30 do
#   title_test = title_info[rand(0..4)]
#   description_test = title_info[rand(0..4)]
#   quantity_test = rand(8..25)
#   price_test = prices_info[rand(0..4)]
#
# 	Product.create!([title: title_test, description: description_test, quantity: quantity_test,
# 		price: price_test])
# end

categories.each do |main_category, sub_categories|
  Category.create!([name: main_category, is_main_category: true])
  @main_category = Category.where(:name => main_category).first

  sub_categories.each do |sub_category|
    Category.create!([name: sub_category, parent_category_id: @main_category.id])
    @sub_category = Category.where(:name => sub_category).first


  end

end

puts "Done...."
