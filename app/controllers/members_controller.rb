class MembersController < ApplicationController

  def index
    # /members
    @members = Member.where(is_alumni: false , is_professor: false)
  end

  def show
    # /members/:id
    @member = Member.find(params[:id])
  end

  def alumni
    # /alumni
    @members = Member.where(is_alumni: true, is_professor: false)
  end

  def professor
    # /professor
    @member = Member.where(is_professor: true).first
    render template: "members/show"
  end

end
