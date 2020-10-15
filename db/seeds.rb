#This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.new(
   email: 'kanrinin@kanrinin.com',
   password: 'kanrinin'
)
admin.save!

# Genre.create!(
#    name: 'ケーキ',
#    is_active: true
# )

# Item.create!(
#    name: 'カレーパン',
#    image_id: nil,
#    introduction: 'めっちゃからい',
#    price: 100,
#    genre_id: 1,
#    is_active: true
# )

# end_user = EndUser.new(
#    last_name: 'お客',
#    first_name: '三太郎',
#    last_name_kana: 'オキャク',
#    first_name_kana: 'サンタロウ',
#    email: 'okyakusantarou@okyakusantarou.com',
#    password: 'okyaku',
#    postal_code: '000-0000',
#    address: '東京都新宿区',
#    telephone_number: '000-0000-0000',
#    is_deleted: false
# )
# end_user.save!

# Order.create!(
#    end_user_id: 1,
#    postal_code: '000-0000',
#    address: '東京都新宿区',
#    name: 'お客三太郎',
#    shipping_cost: 100,
#    total_payment: 200,
#    payment_method: 0,
#    status: 0
# )
# OrderDetail.create!(
#    order_id: 1,
#    item_id: 1,
#    price: 100,
#    amount: 1,
#    making_status: 0
# )