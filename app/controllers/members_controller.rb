class MembersController < ApplicationController

  def index
    # /members
    @members = Member.where(is_alumni: false , is_professor: false).paginate(:page => params[:page])
  end

  def show
    # /members/:id
    @member = Member.find(params[:id])
  end

  def alumni
    # /alumni
    @members = Member.where(is_alumni: true, is_professor: false).paginate(:page => params[:page])
  end

  # def professor
  #   # /professor
  #   @member = Member.where(is_professor: true).first
  #   render template: "members/show"
  # end

   
  private

  def member_params
    params.require(:member).permit(:name,
                                   :image_url,
                                   :occupation,
                                   :email,
                                   :description,
                                   :user_id,
                                   :is_professor,
                                   :is_alumni)
  end
end