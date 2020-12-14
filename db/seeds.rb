# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats = Cat.create([{name: "Intelligentsia", birth_date: "2001/02/03", color: "black", sex: "M", description: "friendly cat"},
{name: "Pinterest", birth_date: "2006/02/03", color: "black", sex: "M", description: "friendly cat"},
{name: "Paleo", birth_date: "2009/07/03", color: "black", sex: "M", description: "friendly cat"},
{name: "Viral", birth_date: "2016/02/03", color: "black", sex: "M", description: "friendly cat"},
{name: "Everyday", birth_date: "2018/02/03", color: "black", sex: "M", description: "friendly cat"},
{name: "Hoodie", birth_date: "2017/02/03", color: "black", sex: "M", description: "friendly cat"},
{name: "Ethical", birth_date: "2020/10/03", color: "black", sex: "M", description: "friendly cat"},
{name: "Hella", birth_date: "2020/05/03", color: "black", sex: "M", description: "friendly cat"},
{name: "Butcher", birth_date: "2020/06/03", color: "black", sex: "M", description: "friendly cat"},
{name: "Fussili", birth_date: "2020/08/03", color: "black", sex: "M", description: "friendly cat"}
])

cat_rental_requests = CatRentalRequest.create([{cat_id: 1, start_date: "2020/01/20", end_date: "2020/01/30"},
                                                {cat_id: 1, start_date: "2020/02/20", end_date: "2020/02/28"},
                                                {cat_id: 1, start_date: "2020/03/20", end_date: "2020/03/30"},
                                                {cat_id: 1, start_date: "2020/01/10", end_date: "2020/01/20"},
                                                {cat_id: 1, start_date: "2020/01/10", end_date: "2020/01/25"},
                                                {cat_id: 1, start_date: "2020/01/10", end_date: "2020/01/30"},
                                                {cat_id: 1, start_date: "2020/01/10", end_date: "2020/01/31"},
                                                {cat_id: 1, start_date: "2020/01/20", end_date: "2020/01/25"},
                                                {cat_id: 1, start_date: "2020/01/20", end_date: "2020/01/30"},
                                                {cat_id: 1, start_date: "2020/01/20", end_date: "2020/01/31"},
                                                {cat_id: 1, start_date: "2020/01/25", end_date: "2020/01/26"},
                                                {cat_id: 1, start_date: "2020/01/25", end_date: "2020/01/31"},
                                                {cat_id: 1, start_date: "2020/01/30", end_date: "2020/02/05"}])