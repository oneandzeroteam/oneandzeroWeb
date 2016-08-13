class TimelineController < ApplicationController
  def index
    @timeline = Timeline.all

    respond_to do |format|
      format.html # index.html.erb.erb
      format.xml {render :xml => @timeline}
    end
  end

  def insert
  end

  def update
  end

  def delete
  end
end
