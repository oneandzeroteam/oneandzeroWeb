class MembersController < ApplicationController

  def create
    @member = Member.create(member_params)
    
    respond_to do |format|
      if @member.save
        if ((@user = @member.find_pairUser(@member.email)) != nil)
          if @member.add_linkage_with_user(@user)
            format.html { redirect_to admin_members_path,
              notice: "Member #{@member.name} was created and linked same User." }
          end
        else
          format.html { redirect_to admin_members_path,
            notice: "Member #{@member.name} was created." }
        end
      else
        format.html { redirect_to admin_members_path,
          notice: "Creating Member was Failed."}
      end
    end
  end

  def new
    @member = Member.new
    render template: "members/new_member"
  end

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
