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
        format.xml  { render :xml => @timeline }
    end
  end

  def new
    if user_signed_in?
        @timeline = Timeline.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @timeline=Timeline.new(timeline_params)

    respond_to do |format|
      if @timeline.save
        format.html { redirect_to "/timeline" , notice: 'Post was successfully created.' }
      else
        format.html { redirect_to "/timeline" }
      end
    end
  end

  def edit
    if user_signed_in?
      @timeline = Timeline.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @timeline = Timeline.find(params[:id])
    @timeline.destroy
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def timeline_params
      params.require(:timeline).permit(:title, :contents, :date)
    end
end
