class SearchController < ApplicationController
  def search
    @results = []
    @results << Borrowablestuff.search(params[:query])
    @results << Member.search(params[:query])
    @results << Post.search(params[:query])
    @results << Project.search(params[:query])
  end
end
