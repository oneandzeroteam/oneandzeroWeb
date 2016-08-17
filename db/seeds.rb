# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Administrator
User.new(email: "admin@oaz.com", password: "1234", name: "관리자", is_admin: true, is_member: true, confirmed_at: DateTime.now).save(validate: false)
Board.create(name: 'tech-blog')

Member.create(name: 'Hana-Kim', image_url: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTCTkOgzjmmH9ql4kGPgcAvI02RjThxk9GROpK6xz-Lt2ly_DZ4LzZkYA", occupation: "운영진")
Project.create(title: "하나와영 웹프로젝트", short_description: "하나와영 공식 웹페이지 프로젝트 Ruby on Rails", is_ongoing: true)
Project.create(title: "TEAM RASPBERRY", short_description: "라즈베리 파이를 이용한 패러럴 컴퓨팅 프로젝트", is_ongoing: false)


# Timeline Seeds
Timeline.create(title: "하나와영 탄생", description: "왜 탄생했을까", date: DateTime.new(1999, 01, 01))
Timeline.create(title: "2013년 회장 부임식", description: "노창재 회장이 부임함", image_url: "https://scontent.xx.fbcdn.net/v/t1.0-9/321388_523037847730713_312580791_n.jpg?oh=92219af599ff65750db6d971ed1a84ba&oe=5859FFB4", image_caption: "노창재 신임회장이 학회를 넘겨받고 있다.", content_title: "노창재 신임회장은 2013년 개강총회에서 회장으로 선출", content_body: "노창재 회장이 1일 만장일치로 개강총회에서 회장직이 당선되었습니다", date: DateTime.new(2013, 03, 1))
Timeline.create(title: "네이버 D2 참가", description: "네이버에서 주최하는 D2 캠퍼스 행사에 운영진이 참가함", image_url: "https://scontent.xx.fbcdn.net/v/t1.0-9/12742407_482383551949513_1674226440383779987_n.jpg?oh=dd2f12fb21a3e4d4ea1eb5e5922f3ed1&oe=58462336", date: DateTime.new(2016, 02, 24))
Timeline.create(title: "2014년 하나와영 핸즈 합동 전시회", description: "하나와영과 핸즈가 공동으로 여는 합동전시회가 열렸습니다", image_url: "https://scontent.xx.fbcdn.net/v/t1.0-9/1932250_275204415977414_1347649047_n.jpg?oh=023fc7b28c8b7f9afe4740f85ac1b19d&oe=5848AE8D", date: DateTime.new(2014, 03, 19))


# Board Seeds
User.new(email: "nicholaskim94@gmail.com", password: "1234", name: "김승주", is_admin: true, is_member: true, confirmed_at: DateTime.now).save(validate: false)
Board.create(name: 'Sweet-facts')
Post.create(board_id: 2, user_id: 2, title: "CUPCAKE IPSUM", content: "Tiramisu sweet sugar plum ice cream. Pudding jelly chocolate bar dessert. Sugar plum candy cheesecake sugar plum danish liquorice pastry tootsie roll. Cookie pie cake cotton candy. Sweet caramels marzipan. Caramels soufflé sweet oat cake. Cotton candy lollipop croissant jujubes. Donut topping tart bear claw candy candy ice cream croissant. Topping gummies brownie soufflé cake oat cake cake sweet. Tart gingerbread ice cream. Dessert donut halvah jelly chupa chups bear claw. Tootsie roll tiramisu gummies fruitcake croissant ice cream. Powder jelly-o tootsie roll cookie dragée cake tiramisu chocolate bar marzipan. Lollipop sugar plum chocolate dessert dessert jelly.
Tart brownie sweet wafer topping jelly beans oat cake. Gingerbread sugar plum sweet roll halvah brownie macaroon macaroon bear claw. Soufflé macaroon bear claw wafer. Halvah carrot cake lemon drops sugar plum. Bear claw liquorice ice cream pudding pastry gummies brownie jelly beans bonbon. Danish pudding gummies liquorice sesame snaps. Gummi bears chocolate wafer pastry gummi bears liquorice pastry bear claw muffin. Cookie topping tiramisu pastry muffin ice cream cupcake lemon drops jelly. Tart jelly beans jelly-o. Marshmallow brownie tootsie roll. Dessert apple pie lemon drops gingerbread icing sugar plum. Brownie apple pie icing lollipop bonbon muffin gummies gummies lemon drops.
Chocolate cake chocolate cookie halvah jujubes oat cake macaroon chocolate bar. Cake muffin tootsie roll bear claw macaroon. Carrot cake oat cake sugar plum chocolate cake. Soufflé toffee jelly candy cupcake sweet gingerbread soufflé. Gummies tiramisu candy canes danish. Topping apple pie candy caramels powder biscuit cookie. Chupa chups topping cupcake pudding toffee tiramisu sweet roll candy canes muffin. Croissant powder chocolate cake chupa chups. Gummi bears sugar plum wafer apple pie gingerbread cookie cotton candy. Lemon drops topping macaroon oat cake sweet dessert biscuit brownie. Ice cream caramels soufflé soufflé. Donut biscuit sugar plum chocolate bar sugar plum gingerbread candy tootsie roll candy canes.
Jelly sesame snaps tootsie roll. Lollipop jelly beans marzipan donut toffee donut tart pastry. Sweet donut liquorice tart sesame snaps pastry chocolate. Jelly beans candy jujubes lollipop cotton candy cookie jujubes. Jujubes jelly icing halvah sweet gummies donut jelly. Halvah jujubes gummies cupcake oat cake. Tootsie roll chupa chups chupa chups cheesecake powder chocolate sugar plum jelly-o halvah. Liquorice biscuit pie sugar plum apple pie. Gummies cake jelly chocolate cake sesame snaps lollipop. Wafer toffee tiramisu lollipop donut jujubes toffee sugar plum gingerbread. Halvah ice cream jujubes candy canes. Danish chupa chups pudding fruitcake bonbon bear claw marshmallow chupa chups jelly-o. Topping brownie jelly beans. Candy cheesecake dessert gingerbread candy canes pastry.
Biscuit pudding powder caramels danish. Muffin gummies lemon drops chocolate cake oat cake macaroon. Liquorice ice cream halvah tiramisu cookie cake. Croissant ice cream donut cake powder. Macaroon muffin chocolate chocolate bar. Cheesecake gummies sesame snaps chocolate bar tart muffin marshmallow gummi bears marzipan. Dragée sweet donut pie tootsie roll. Sugar plum soufflé lollipop. Tiramisu cake gummies pudding cheesecake biscuit. Pastry jelly-o jelly gummies marzipan. Chupa chups dragée gummies halvah macaroon. Lollipop gummies chupa chups cheesecake muffin pastry gummi bears tart. Toffee macaroon icing soufflé. Brownie cupcake chocolate bar.")