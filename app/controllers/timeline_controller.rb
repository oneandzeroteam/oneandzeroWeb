class TimelineController < ApplicationController
  def index
    @timelines = Timeline.paginate(:page => params[:page]).order(:date).reverse_order
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

end
