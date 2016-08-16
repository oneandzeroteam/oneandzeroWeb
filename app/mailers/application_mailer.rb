class ApplicationMailer < ActionMailer::Base
  default from: 'oaz@oaz.korea.ac.kr'
  layout 'mailer'

  def recruit_mail(resume)
	  @name=resume[:name]
	  @phoneNumber=resume[:phoneNumber]
	  @email=resume[:email]
	  @message=resume[:message]
	  mail(to: "nicholaskim94@gmail.com", subject: "하나와영 지원서")
  end
end
