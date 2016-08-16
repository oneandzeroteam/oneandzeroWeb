class PagesController < ApplicationController
  def show
    if valid_page?
      render template: "pages/#{params[:pagename]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  def recruit_check
	  if request.xhr?
		  name = params[:name]
		  phoneNumber = params[:phoneNumber]
		  email = params[:email]
		  message = params[:message]

		  valid = false
		  reason = ""
		  if name.length == 0
			  reason = "이름이 없습니다."
		  elsif phoneNumber.length == 0
			  reason = "전화번호가 없습니다."
		  elsif email.length == 0
			  reason = "이메일이 없습니다."
		  elsif message.length == 0
			  reason = "메시지가 없습니다."
		  else
		  	resume={name: name, phoneNumber: phoneNumber, email: email, message: message}
		  	ApplicationMailer.recruit_mail(resume).deliver_now
			valid = true
		  end
		  respond_to do |format|
			  if valid
			  	msg = { status: "success", reason: reason, name: name, phoneNumber: phoneNumber, email: email, message: message }
			  else
			  	msg = { status: "fail", reason: reason, name: name, phoneNumber: phoneNumber, email: email, message: message }
			  end
			  format.json  { render :json => msg }
		  end
	  end
  end

  private

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:pagename]}.html.erb"))
  end

end
