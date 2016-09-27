# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ADMIN SEED - FOR PRODUCTION
m = Member.create(name: '김재훈', facebook_url: 'https://www.facebook.com/turtle.gatpa?fref=ts', occupation: '회장', description: '착하고 은근히 리더십이 있어서 학회를 잘 이끌어감. 뭐 필요하면 연락하면 된다. 좀 더 카리스마 있게 해도 괜찮을 듯.', is_admin: true, email: 'gatpa@korea.ac.kr')
m.attachment = Attachment.create(file: open(File.join(Rails.root, 'app/assets/images/admins/JH.png')), member_id: m.id)
m = Member.create(name: '오영택', facebook_url: 'http://facebook.com/youlooksoupset', occupation: '부회장', description: '15학번인데 벌써 부회장의 자리에 오른 능력자. 차기 회장이라는 소문이 있던데...?!', is_admin: true, email: 'vnv1051@naver.com')
m.attachment = Attachment.create(file: open(File.join(Rails.root, 'app/assets/images/admins/YT.png')), member_id: m.id)
m = Member.create(name: '신홍규', facebook_url: 'https://www.facebook.com/profile.php?id=100005457848000&fref=ts', occupation: '학회원', description: '베일에 감춰진 신비스러운 존재. 우리는 아직 그를 잘 모른다. 궁금하면 학회에 들어오면 된다.', is_admin: false)
m.attachment = Attachment.create(file: open(File.join(Rails.root, 'app/assets/images/admins/HG.png')), member_id: m.id)
m = Member.create(name: '김승주', facebook_url: 'https://www.facebook.com/nicholas.kim.1994', occupation: '총무', description: '학회의 돈줄을 쥐고 있는 실권자이지만 일도 실제로 많이 한다.', is_admin: true, email: 'nicholaskim94@gmail.com')
m.attachment = Attachment.create(file: open(File.join(Rails.root, 'app/assets/images/admins/SJ.png')), member_id: m.id)
m = Member.create(name: '김대한', facebook_url: 'https://www.facebook.com/daehan.kim.7902?fref=ts', occupation: '부회장', description: '학회의 떠오르는 별이다. 수학을 전공하고 있지만 소프트웨어에 더 관심이 많다.', is_admin: true, email: 'kdh5852@naver.com')
m.attachment = Attachment.create(file: open(File.join(Rails.root, 'app/assets/images/admins/DH.png')), member_id: m.id)

# MEMBER SEED - FOR PRODUCTION
Member.create(name: '장태훈', facebook_url: '#', occupation: '학회원', description: '하나와영의 학회원이다.', is_admin: false, email: 'cloudlesslakitu67@gmail.com')

m = Member.create(name: '이혜진', facebook_url: '#', occupation: '학회원', description: '하나와영의 학회원이다.', is_admin: false, email: 'ku24@korea.ac.kr')
m.attachment = Attachment.create(file: open(File.join(Rails.root, 'app/assets/images/members/LHJ.jpg')), member_id: m.id)
m = Member.create(name: '김인수', facebook_url: '#', occupation: '학회원', description: '하나와영의 학회원이다.', is_admin: false, email: '제공하지 않음')
m.attachment = Attachment.create(file: open(File.join(Rails.root, 'app/assets/images/members/KIS.jpg')), member_id: m.id)
m = Member.create(name: '정규열', facebook_url: '#', occupation: '학회원', description: '하나와영의 학회원이다.', is_admin: false, email: '제공하지 않음')
m.attachment = Attachment.create(file: open(File.join(Rails.root, 'app/assets/images/members/JGY.jpg')), member_id: m.id)
m = Member.create(name: '이세령', facebook_url: '#', occupation: '학회원', description: '하나와영의 학회원이다.', is_admin: false, email: '제공하지 않음')
m.attachment = Attachment.create(file: open(File.join(Rails.root, 'app/assets/images/members/LSR.jpg')), member_id: m.id)
m = Member.create(name: '노창재', facebook_url: '#', occupation: '학회원', description: '하나와영의 학회원이다.', is_admin: false, email: '제공하지 않음')
m.attachment = Attachment.create(file: open(File.join(Rails.root, 'app/assets/images/members/RCJ.png')), member_id: m.id)
m = Member.create(name: '서가람', facebook_url: '#', occupation: '학회원', description: '하나와영의 학회원이다.', is_admin: false, email: '제공하지 않음')
m.attachment = Attachment.create(file: open(File.join(Rails.root, 'app/assets/images/members/SGR.png')), member_id: m.id)


# Administrator
User.new(email: "admin@oaz.com", password: "1234", name: "관리자", is_admin: true, is_member: true, confirmed_at: DateTime.now).save(validate: false)
Board.create(name: 'tech-blog')





# Project Seeds
p = Project.create(title: "하나와영 웹프로젝트", short_description: "하나와영 공식 웹페이지 프로젝트 Ruby on Rails", is_ongoing: true, reference_url: "https://github.com/oneandzeroteam/oneandzeroWeb")
p.attachments << Attachment.create(file: open(File.join(Rails.root, 'app/assets/images/projects/oneandzeroWeb.jpeg')), project_id: p.id)
p = Project.create(title: "TEAM RASPBERRY", short_description: "라즈베리 파이를 이용한 패러럴 컴퓨팅 프로젝트", is_ongoing: false)
p.attachments << Attachment.create(file: open(File.join(Rails.root, 'app/assets/images/projects/teamRaspberry.jpg')), project_id: p.id)

# Timeline Seeds
Timeline.create(title: "하나와영 탄생", description: "왜 탄생했을까", date: DateTime.new(1999, 01, 01))
Timeline.create(title: "2013년 회장 부임식", description: "노창재 회장이 부임함", image_url: "https://scontent.xx.fbcdn.net/v/t1.0-9/321388_523037847730713_312580791_n.jpg?oh=92219af599ff65750db6d971ed1a84ba&oe=5859FFB4", image_caption: "노창재 신임회장이 학회를 넘겨받고 있다.", content_title: "노창재 신임회장은 2013년 개강총회에서 회장으로 선출", content_body: "노창재 회장이 1일 만장일치로 개강총회에서 회장직이 당선되었습니다", date: DateTime.new(2013, 03, 1))
Timeline.create(title: "네이버 D2 참가", description: "네이버에서 주최하는 D2 캠퍼스 행사에 운영진이 참가함", image_url: "https://scontent.xx.fbcdn.net/v/t1.0-9/12742407_482383551949513_1674226440383779987_n.jpg?oh=dd2f12fb21a3e4d4ea1eb5e5922f3ed1&oe=58462336", date: DateTime.new(2016, 02, 24))
Timeline.create(title: "2014년 하나와영 핸즈 합동 전시회", description: "하나와영과 핸즈가 공동으로 여는 합동전시회가 열렸습니다", image_url: "https://scontent.xx.fbcdn.net/v/t1.0-9/1932250_275204415977414_1347649047_n.jpg?oh=023fc7b28c8b7f9afe4740f85ac1b19d&oe=5848AE8D", date: DateTime.new(2014, 03, 19))

# BorrowableStuff Seeds
(1...20).each { |code| Borrowablestuff.create(stufftype: "Monitor", description: "싸구려 모니터", stuffcode: code)}

# Posts.Seeds
(1...30).each { |i| Post.create(board_id: 1, user_id: 1, title: "루비와 익명 함수 - 블록(block), Proc(절차, procedure) 객체와 람다(lambda) 함수의 차이 이해하기" , content: "
Proc(절차, Procedure) 객체 이해하기
Proc 객체 실행하기
블록
proc
Proc 객체와 람다(lambda)
Proc#lambda? 를 사용한 lambda 여부 확인
인자 검사 방식의 차이
return 작동 방식의 차이
break 작동 방식의 차이
블록과 Proc 객체의 차이
결론
참고자료
루비 Advent Calendar 2015 7일차로 참석합니다.

루비에서 가장 특징적이고 많이 사용되는 문법이 바로 블록입니다. 루비에서는 블록 문법을 통해서 하나의 익명 함수를 손쉽게 함수에 넘겨줄 수 있습니다. 대부분의 반복문을 비롯해 인터페이스로도 자주 사용되기 때문에 익명 함수 개념을 이해하는 것은 매우 중요합니다. 블록을 사용하지 않더라도 루비에서는 명시적으로 익명 함수 객체를 생성할 수 있습니다. 익명 함수를 만드는 두 가지 대표적인 방법이 바로 Proc 객체와 lambda문을 사용하는 것입니다. 이 글에서는 루비에서의 익명 함수와 Proc 객체와 lambda문으로 생성된 익명 함수의 차이점을 살펴보겠습니다.

Proc(절차, Procedure) 객체 이해하기

루비에서는 Proc 클래스를 통해서 익명 함수를 생성할 수 있습니다. 여기서 Proc은 Procedure의 줄임말로 어떤 처리 과정(절차)을 담고있다는 의미입니다. Proc 또한 일반적인 루비 클래스와 다르지 않으므로 Prow.new 메서드를 통해서 객체를 생성할 수 있습니다.

Proc.new
# ArgumentError: tried to create Proc object without a block
설명이 조금 까다로워집니다만, Proc.new 메서드는 블록을 통해서 절차(루비 표현식들)를 넘겨받습니다. 설명이 귀찮아진다는 의미는 블록 자체도 익명 함수기 때문입니다. 루비에서는 메서드 뒤에 do...end 형태로 블록이라는 특별한 문법을 사용할 수 있습니다. do와 end 사이에는 루비 표현식이 들어갑니다. 이 do...end 사이의 표현식들은 실행되지 않은 채로 익명 함수로서 그대로 실행하는 메서드에 전달됩니다. 여기서는 이 부분에 대해서는 다루지 않을 것입니다. 어쨌건 루비 표현식들이 고스란히 함수로 전달된다는 것이 중요합니다.

Proc.new도 블록을 통해서 익명 함수를 전달받습니다.

Proc.new do
  puts 'Hello, world!'
end
# => #<Proc:0x007f99f12c6bf8@(pry):2>
Proc.new는 Proc 객체를 반환합니다. 이 생성자 메서드는 넘겨받은 익명 함수에 대해서 어떠한 일도 하지않고, 익명 함수를 그대로 저장을 합니다. 앞서 말했듯이 블록에 쓰여진 루비 표현식은 곧바로 실행되지 않습니다. 따라서 puts 'Hello, world!'는 출력되지 않습니다.

Proc 객체 실행하기

이 Proc 객체는 이제 원하는 시점에 언제라도 실행할 수 있습니다. 다음 예제에서는 이 Proc 객체를 변수에 대입하고 실행하는 방법을 살펴보겠습니다. Proc 객체를 실행하는 방법은 크게 3가지가 있습니다. 첫번째는 .call() 메서드 호출입니다. 제일 명확한 표현법입니다. 이외에도 .()과 []와 같은 조금은 낯설게 보이는 방법도 있습니다. 기본적으로 .call()과 다르지 않습니다.

# 여기서는 편의상 do...end 대신 { }을 사용했습니다
p = Proc.new { puts 'Hello, world!'}

p.call()
# Hello, world!

p.()
# Hello, world!

p[]
# Hello, world!
형태는 다르지만 모두 같은 방식으로 동작하는 걸 알 수 있습니다.

파이썬이나 자바스크립트 같은 언어를 사용해왔다면 이런 표현이 거슬릴 지도 모릅니다. 자바스크립트에서는 익명 함수와 기명함수의 실질적인 차이가 없습니다. 따라서 자바스크립트에서는 아래의 두 방법으로 함수를 선언한 결과가 실질적으로 같습니다.

// 일반적인 함수 선언
function hello1(){ console.log('Hello, world!') }

// 익명 함수를 사용한 함수 선언
var hello2 = function(){ console.log('Hello, world!) };
함수를 호출하는 방법도 같습니다.

hello1()
// Hello, world!

hello2()
// Hello, world!
이는 루비와는 명백히 다릅니다. 위의 루비 예제에서는 익명 함수(Proc 객체)를 proc에 대입했습니다만, 함수처럼 직접 호출하는 것은 불가능합니다.

p()
# NoMethodError: undefined method `a' for main:Object
파이썬이나 자바스크립트에서는 함수 이름으로 접근하면 함수 자체에 접근할 수 있고 이를 직접 호출할 수 있지만 루비에서는 그렇지 않습니다. NoMethodError 예외가 발생하는 이유는 간단합니다. 말그대로 p라는 이름으로 정의된 함수가 존재하지 않기 때문입니다. 이 이유를 이해하기 위해서는 루비의 메서드 호출 방식을 이해할 필요가 있습니다만, 여기서는 익명 함수와 기명 함수가 존재하는 공간이 다르다는 정도에서 넘어가겠습니다.

이 주제에 대해서는 루비와 파이썬에서 함수 호출과 함수 참조에 대한 차이에서 좀 더 자세히 다루고 있으니 참고해주시기 바랍니다.

블록

블록은 엄밀히 말하면 Proc 객체는 아닙니다(이에 대해서는 뒤에서 설명합니다). 단, 메서드 선언시에 & 연산자를 통해서 블록을 명시적으로 Proc 객체로 받아올 수 있습니다.

def hello(&b)
  b.call()
end

hello do
  puts 'Hello, world!
end'
# Hello, world!
proc

Kernel#proc 메서드도 있습니다. 이 메서드는 Proc.new와 같습니다.

p = proc { puts 'Hello, world!' }
p.call()
# Hello, world!
Proc 객체와 람다(lambda)

흥미롭게도(그리고 혼란스럽게도) 루비에는 lambda라고 하는 Proc 객체를 생성하는 또 다른 방법이 존재합니다. 먼저 lambda를 통해서 Proc 객체를 만들어보겠습니다.

l = lambda{ puts 'Hello, world!' }

l.class
# Proc

l.call()
# Hello, world!
루비 1.9부터는 신택스 슈가인 ->를 사용할 수도 있습니다.

->{ puts 'Hello, world!' }
왜 lambda가 존재하는 걸까요? 람다라는 표현을 거슬러 올라가면 람다 대수가 나옵니다. 람다 대수는 알론조 처치에 의해 만들어진 수학 체계입니다. 이 체계가 흥미로운 것은 하나의 인자를 받는 함수들만을 사용하면서, 튜링 컴플리트하다는 점입니다. 즉, 완전히 수학적이면서 튜링 머신에서 가능한 모든 계산이 가능하다는 의미입니다. 단, 여기서 lambda라는 표현은 엄밀한 의미에서 수학적인 표현이라기보다는 루비 이전의 언어들에서 익명 함수를 ���미할 때 사용해오던 관용구라고 이해하는 게 좋습니다. 루비에서는 이렇게 생성된 객체가 일반적인 Proc 객체보다 좀 더 함수답게 작동한다는 차이점을 가지고 있습니다.

Proc#lambda? 를 사용한 lambda 여부 확인

먼저 본격적으로 차이점을 알아버기 전에 일반적인 Proc 객체와 lambda로 만들어진 객체를 구분하는 방법을 살펴보겠습니다. Proc 객체의 lambda? 메서드로 lambda로 생성된 함수인지를 확인할 수 있습니다.

Proc.new{}.lambda? # => false
proc{}.lambda?     # => false
lambda{}.lambda?   # => true
->{}.lambda?       # => true
참고로 일반적인 메서드를 객체화해서 Proc 객체로 변환하면 lambda Proc 객체가 됩니다.

def hello; end
hello_method = method(:hello)
hello_method.to_proc.lambda? # => true
더 자세한 내용은 루비 문서에서 확인할 수 있습니다.

인자 검사 방식의 차이

그 첫 번째 차이점으로 lambda로 만들어진 Proc 객체는 인자 개수를 엄격하게 검사합니다. 일반적으로 블록에서는 블록 인자라는 독특한 방법으로 인자를 받습니다. 여기서는 하나의 인자를 받는 Proc 객체를 만들고, 인자 개수를 바꿔가며 실행해보겠습니다.

hello = Proc.new { |name| puts 'Hello, !'}
hello.call()
# Hello, !

hello.call('Jack')
# Hello, Jack!

hello.call(1, 2, 3, 4, 5)
# Hello, 1!
정의에서는 하나의 인자를 사용하지만, 인자 개수가 달라지더라도 에러가 발생하지 않습니다. 이런 점에서 Proc 객체는 이름 그대로 절차만 저장된 객체라고 할 수 있습니다. 반면 lambda로 만든 Proc 객체는 다르게 작동합니다.
")}

# Board Seeds
User.new(email: "nicholaskim94@gmail.com", password: "1234", name: "김승주", is_admin: true, is_member: true, confirmed_at: DateTime.now).save(validate: false)
Board.create(name: 'Sweet-facts')
Post.create(board_id: 2, user_id: 2, title: "CUPCAKE IPSUM", content: "Tiramisu sweet sugar plum ice cream. Pudding jelly chocolate bar dessert. Sugar plum candy cheesecake sugar plum danish liquorice pastry tootsie roll. Cookie pie cake cotton candy. Sweet caramels marzipan. Caramels soufflé sweet oat cake. Cotton candy lollipop croissant jujubes. Donut topping tart bear claw candy candy ice cream croissant. Topping gummies brownie soufflé cake oat cake cake sweet. Tart gingerbread ice cream. Dessert donut halvah jelly chupa chups bear claw. Tootsie roll tiramisu gummies fruitcake croissant ice cream. Powder jelly-o tootsie roll cookie dragée cake tiramisu chocolate bar marzipan. Lollipop sugar plum chocolate dessert dessert jelly.
Tart brownie sweet wafer topping jelly beans oat cake. Gingerbread sugar plum sweet roll halvah brownie macaroon macaroon bear claw. Soufflé macaroon bear claw wafer. Halvah carrot cake lemon drops sugar plum. Bear claw liquorice ice cream pudding pastry gummies brownie jelly beans bonbon. Danish pudding gummies liquorice sesame snaps. Gummi bears chocolate wafer pastry gummi bears liquorice pastry bear claw muffin. Cookie topping tiramisu pastry muffin ice cream cupcake lemon drops jelly. Tart jelly beans jelly-o. Marshmallow brownie tootsie roll. Dessert apple pie lemon drops gingerbread icing sugar plum. Brownie apple pie icing lollipop bonbon muffin gummies gummies lemon drops.
Chocolate cake chocolate cookie halvah jujubes oat cake macaroon chocolate bar. Cake muffin tootsie roll bear claw macaroon. Carrot cake oat cake sugar plum chocolate cake. Soufflé toffee jelly candy cupcake sweet gingerbread soufflé. Gummies tiramisu candy canes danish. Topping apple pie candy caramels powder biscuit cookie. Chupa chups topping cupcake pudding toffee tiramisu sweet roll candy canes muffin. Croissant powder chocolate cake chupa chups. Gummi bears sugar plum wafer apple pie gingerbread cookie cotton candy. Lemon drops topping macaroon oat cake sweet dessert biscuit brownie. Ice cream caramels soufflé soufflé. Donut biscuit sugar plum chocolate bar sugar plum gingerbread candy tootsie roll candy canes.
Jelly sesame snaps tootsie roll. Lollipop jelly beans marzipan donut toffee donut tart pastry. Sweet donut liquorice tart sesame snaps pastry chocolate. Jelly beans candy jujubes lollipop cotton candy cookie jujubes. Jujubes jelly icing halvah sweet gummies donut jelly. Halvah jujubes gummies cupcake oat cake. Tootsie roll chupa chups chupa chups cheesecake powder chocolate sugar plum jelly-o halvah. Liquorice biscuit pie sugar plum apple pie. Gummies cake jelly chocolate cake sesame snaps lollipop. Wafer toffee tiramisu lollipop donut jujubes toffee sugar plum gingerbread. Halvah ice cream jujubes candy canes. Danish chupa chups pudding fruitcake bonbon bear claw marshmallow chupa chups jelly-o. Topping brownie jelly beans. Candy cheesecake dessert gingerbread candy canes pastry.
Biscuit pudding powder caramels danish. Muffin gummies lemon drops chocolate cake oat cake macaroon. Liquorice ice cream halvah tiramisu cookie cake. Croissant ice cream donut cake powder. Macaroon muffin chocolate chocolate bar. Cheesecake gummies sesame snaps chocolate bar tart muffin marshmallow gummi bears marzipan. Dragée sweet donut pie tootsie roll. Sugar plum soufflé lollipop. Tiramisu cake gummies pudding cheesecake biscuit. Pastry jelly-o jelly gummies marzipan. Chupa chups dragée gummies halvah macaroon. Lollipop gummies chupa chups cheesecake muffin pastry gummi bears tart. Toffee macaroon icing soufflé. Brownie cupcake chocolate bar.")



puts "Seeding Done!"