class TimelineController < ApplicationController
  def index
    @timeline = Timeline.all
    respond_to do |format|
      format.html # index.html.erb.erb
      format.xml {render :xml => @timeline}
    end
  end

  def show
    @timeline = Timeline.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @timeline }
    end
  end

  # def edit
  #   if user_signed_in?
  #     @timeline = Timeline.find(params[:id])
  #   else
  #     redirect_to new_user_session_path
  #   end
  # end
  #
  # def destroy
  #   @timeline = Timeline.find(params[:id])
  #       @timeline.destroy
  #       respond_to do |format|
  #           format.html { redirect_to(posts_url) }
  #           format.xml  { head :ok }
  #         end
  # end

end
