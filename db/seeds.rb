# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Administrator
User.new(email: "admin@oaz.com", password: "1234", is_admin: true, confirmed_at: DateTime.now).save(validate: false)
Board.create(name: 'tech-blog')
Post.create(board_id: 1, user_id: 1, title: "요시", content: "그란도시즌")
Member.create(name: 'Hana-Kim', image_url: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTCTkOgzjmmH9ql4kGPgcAvI02RjThxk9GROpK6xz-Lt2ly_DZ4LzZkYA", occupation: "운영진")
Project.create(title: "하나와영 웹프로젝트", short_description: "하나와영 공식 웹페이지 프로젝트 Ruby on Rails", is_ongoing: true)
Project.create(title: "TEAM RASPBERRY", short_description: "라즈베리 파이를 이용한 패러럴 컴퓨팅 프로젝트", is_ongoing: false)
