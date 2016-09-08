class ApplicationMailer < ActionMailer::Base
  default from: 'oaz@oaz.korea.ac.kr'
  layout 'mailer'

  def recruit_mail(resume)
		mailing_list = []
		Member.where(is_admin:true).each { |admin| mailing_list << admin.email }
	  @name=resume[:name]
	  @phoneNumber=resume[:phoneNumber]
	  @email=resume[:email]
	  @message=resume[:message]
	  mail(to: mailing_list, subject: "하나와영 지원서")
  end
end
