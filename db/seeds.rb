# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all


users = User.create([{username: "szilvi", password: "haliho"},
                    {username: "szilvi1", password: "haliho1"},
                    {username: "szilvi2", password: "haliho2"},
                    {username: "szilvi3", password: "haliho3"},
                    {username: "szilvi4", password: "haliho4"},
                    {username: "szilvi5", password: "haliho5"},
                    {username: "szilvi6", password: "haliho6"}])

cats = Cat.create([{name: "Intelligentsia", birth_date: "2001/02/03", color: "black", sex: "M", description: "friendly cat", user_id: User.find_by(username: "szilvi").id},
{name: "Pinterest", birth_date: "2006/02/03", color: "black", sex: "M", description: "friendly cat", user_id: User.find_by(username: "szilvi1").id},
{name: "Paleo", birth_date: "2009/07/03", color: "black", sex: "M", description: "friendly cat", user_id: User.find_by(username: "szilvi2").id},
{name: "Viral", birth_date: "2016/02/03", color: "black", sex: "M", description: "friendly cat", user_id: User.find_by(username: "szilvi3").id},
{name: "Everyday", birth_date: "2018/02/03", color: "black", sex: "M", description: "friendly cat", user_id: User.find_by(username: "szilvi4").id},
{name: "Hoodie", birth_date: "2017/02/03", color: "black", sex: "M", description: "friendly cat", user_id: User.find_by(username: "szilvi5").id},
{name: "Ethical", birth_date: "2020/10/03", color: "black", sex: "M", description: "friendly cat", user_id: User.find_by(username: "szilvi6").id},
{name: "Hella", birth_date: "2020/05/03", color: "black", sex: "M", description: "friendly cat", user_id: User.find_by(username: "szilvi1").id},
{name: "Butcher", birth_date: "2020/06/03", color: "black", sex: "M", description: "friendly cat", user_id: User.find_by(username: "szilvi2").id},
{name: "Fussili", birth_date: "2020/08/03", color: "black", sex: "M", description: "friendly cat", user_id: User.find_by(username: "szilvi3").id}
])

cat_rental_requests = CatRentalRequest.create([{cat_id: Cat.find_by(name: "Pinterest").id, start_date: "2020/01/20", end_date: "2020/01/30", user_id: User.find_by(username: "szilvi6").id},
                                                {cat_id: Cat.find_by(name: "Viral").id, start_date: "2020/02/20", end_date: "2020/02/28", user_id: User.find_by(username: "szilvi5").id},
                                                {cat_id: Cat.find_by(name: "Hoodie").id, start_date: "2020/03/20", end_date: "2020/03/30", user_id: User.find_by(username: "szilvi4").id},
                                                {cat_id: Cat.find_by(name: "Hella").id, start_date: "2020/01/10", end_date: "2020/01/20", user_id: User.find_by(username: "szilvi3").id},
                                                {cat_id: Cat.find_by(name: "Ethical").id, start_date: "2020/01/10", end_date: "2020/01/25", user_id: User.find_by(username: "szilvi2").id},
                                                {cat_id: Cat.find_by(name: "Fussili").id, start_date: "2020/01/10", end_date: "2020/01/30", user_id: User.find_by(username: "szilvi1").id},
                                                {cat_id: Cat.find_by(name: "Paleo").id, start_date: "2020/01/10", end_date: "2020/01/31", user_id: User.find_by(username: "szilvi").id},
                                                {cat_id: Cat.find_by(name: "Everyday").id, start_date: "2020/01/20", end_date: "2020/01/25", user_id: User.find_by(username: "szilvi1").id},
                                                {cat_id: Cat.find_by(name: "Butcher").id, start_date: "2020/01/20", end_date: "2020/01/30", user_id: User.find_by(username: "szilvi2").id},
                                                {cat_id: Cat.find_by(name: "Viral").id, start_date: "2020/01/20", end_date: "2020/01/31", user_id: User.find_by(username: "szilvi3").id},
                                                {cat_id: Cat.find_by(name: "Pinterest").id, start_date: "2020/01/25", end_date: "2020/01/26", user_id: User.find_by(username: "szilvi4").id},
                                                {cat_id: Cat.find_by(name: "Hoodie").id, start_date: "2020/01/25", end_date: "2020/01/31", user_id: User.find_by(username: "szilvi5").id},
                                                {cat_id: Cat.find_by(name: "Fussili").id, start_date: "2020/01/30", end_date: "2020/02/05", user_id: User.find_by(username: "szilvi6").id}])
