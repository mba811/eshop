# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Seeding......"

# create_account = User.create([email: "2@2.cn", password:"abcabc",password_confirmation: "abcabc",is_admin:"true"])
# #
# puts "Admin account created."
# #
# create_account_user = User.create([email: "1@1.com", password:"abcabc",password_confirmation: "abcabc",is_admin:"false"])
# #
# puts "User account created."


# ..............................
#   0. create banners
# ..............................
#


# img_folder = "#{Rails.root}/public/images/banners"
#
# slides = ["#{img_folder}/slide1.jpg", "#{img_folder}/slide2.jpg"]
# for slide in slides
#   Banner.create!([is_slide: true,
#                 cover: File.open(slide),
#                 is_hidden: false])
# end
# puts "Slide created..."
#
#
# banners = ["#{img_folder}/banner1.jpg", "#{img_folder}/banner2.jpg"]
# for banner in banners
#   Banner.create!([is_slide: false,
#                 cover: File.open(banner),
#                 is_hidden: false])
# end
# puts "Banners created..."



# ..............................
#   1. get books json
# ..............................
#
# Note:
# 1. get books josn 2. get books categories 3. add book categories
# 1. get books josn 4. add books

require 'json'
require 'set'

puts "#{Rails.root}"

img_folder = "#{Rails.root}/public/images/book-store"
puts img_folder

file = "#{img_folder}/z-books-3.txt"
content = File.read(file)
content_json = JSON.parse(content)


# ..............................
#   2. get Book Categories
# ..............................

categories = {}
content_json.each do |item|

  main_category = item["main_category"]
  sub_category = item["sub_category"]

  sub_categories = categories[main_category]
  if !sub_categories
    sub_categories = Set.new
    sub_categories << sub_category
  else
    sub_categories << sub_category
  end

  categories[main_category] = sub_categories

end


# ..............................
#   3. Add Book Categories
# ..............................
#
puts "Seeding......"
categories.each do |main_category, sub_categories|
  main_category = main_category.strip()

  Category.create!([name: main_category, is_main_category: true])
  @main_category = Category.where(:name => main_category).first

  sub_categories.each do |sub_category|
    sub_category = sub_category.strip()

    Category.create!([name: sub_category, parent_category_id: @main_category.id])
    @sub_category = Category.where(:name => sub_category).first
  end
end

puts "Categories Added Done...."


# ..............................
#   4. Add Books
# ..............................
#
# content_json.each do |item|
#   title = item["title"]
#   price = item["price"]
#   author = item["author"]
#
#   main_category = item["main_category"].strip()
#   @main_category = Category.where("name = ?", main_category).first
#   # puts "main_category.name: #{@main_category.name}"
#   # puts "main_category.id : #{@main_category.id}"
#
#   sub_category = item["sub_category"].strip()
#   # puts "sub_category: #{sub_category}"
#   @sub_category = Category.where(["name = ? AND parent_category_id = ? ",
#                                   sub_category, @main_category.id]).first
#
#
#   Product.create!([
#       :title => title,
#       :quantity => 500,
#       :price => price,
#       :author => author,
#       :onsale => true,
#       :category_id => @sub_category.id
#   ])
#   # puts "Start create product..."
#   puts "title: #{title}"
#
#   @product = Product.order(id: :desc).first
#
#   # puts "End create product #{@product.id}"
#
#   # puts "Start create Photo..."
#   img_gallery = item["img_gallery"]
#   for img_url in img_gallery
#     img_name = img_url.split('/')[-1]
#     img_path = "#{img_folder}/#{img_name}"
#     Photo.create!([:product_id => @product.id,
#                   :avatar => File.open(img_path)])
#     # puts "\t\t upload photo #{img_name}"
#   end
# end

# puts "Done..."
