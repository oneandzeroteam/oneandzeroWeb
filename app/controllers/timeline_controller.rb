class TimelineController < ApplicationController
  def show
    @timelines = Timeline.all

    respond_to do |format|
      format.html # index.html.erb
      rormat.xml {render :xml => @timelines}
    end
  end

  def insert
  end

  def update
  end

  def delete
  end
end
