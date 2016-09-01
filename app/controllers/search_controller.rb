class SearchController < ApplicationController
  def search
    results = []
    results << @items = Borrowablestuff.search(params[:query])
    results << @members = Member.search(params[:query])
    results << @posts = Post.search(params[:query])
    results << @projects = Project.search(params[:query])

    @time_elapsed = 0
    results.each {|obj| @time_elapsed += obj.took}
  end
end
