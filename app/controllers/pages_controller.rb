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
		  ApplicationMailer.recruit_mail().deliver_now
		  respond_to do |format|
			  msg = { :status => "ok", :name => name, :phoneNumber => phoneNumber, :email => email, :message => message }
			  format.json  { render :json => msg }
		  end
	  end
  end

  private

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:pagename]}.html.erb"))
  end

end
