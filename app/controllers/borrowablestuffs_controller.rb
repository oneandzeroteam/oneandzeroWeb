class BorrowablestuffsController < ApplicationController
  before_action :set_borrowablestuff, only: [:show, :edit, :destroy, :borrow, :return]
  before_action :set_user

  def index # 종류별 리스팅, todo
    @borrowablestuffs = Borrowablestuff.all
  end

  def show
  end

  def edit
    if is_admin?
      #todo
    else
    end
  end

  def update
    respond_to do |format|
      if @borrowablestuff.update_attributes(params[:borrowablestuff])
        format.html { redirect_to(@borrowablestuff, :notice => 'borrowablestuff was successfully updated.') }
        format.json { render :show, status: :updated, location: @borrowablestuff }
      else
        format.html { render :new }
        format.json { render json: @borrowablestuff.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @burrowablestuff = Borrowablestuff.new
  end

  def create
    @borrowablestuff = Borrowablestuff.new(borrowablestuff_params)
    @borrowablestuff.create_code
    @borrowablestuff.max_lendingperiod = 14 # todo 제거
    respond_to do |format|
      if @borrowablestuff.save
        if params[:borrowflag]
          redirect_to { redirect_to action: "borrow" }
        else
          format.html { redirect_to(@borrowablestuff, :notice => 'borrowablestuff was successfully created.') }
          format.json { render :show, status: :created, location: @borrowablestuff }
        end
      else
        format.html { render :new }
        format.json { render json: @borrowablestuff.errors, status: :unprocessable_entity }
      end
    end
  end

  def borrow
    if _user_signed_in?
      respond_to do |format|
        if @borrowablestuff.borrow(@user, params[:lended_period].to_i)
          format.html { redirect_to(@borrowablestuff, :notice => 'borrowablestuff was successfully borrowed.') }
          format.json { render :show, status: :updated, location: @borrowablestuff }
        else
          format.html { redirect_to(@borrowablestuff, :notice => 'failed.') }
          format.json { render json: @borrowablestuff.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def return
    respond_to do |format|
      if (@remain_period = @borrowablestuff.return) # todo return=negative -> expired panalty
        format.html { redirect_to(@borrowablestuff, :notice => 'borrowablestuff was successfully returned.') }
        format.json { render :show, status: :updated, location: @borrowablestuff }
      else
        format.html { redirect_to(@borrowablestuff, :notice => 'failed.') }
        format.json { render json: @borrowablestuff.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if is_admin?
      @borrowablestuff.destroy
      respond_to do |format|
        format.html { redirect_to borrowablestuffs_url, notice: 'borrowablestuff was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      #todo
    end
  end

  private

  def _user_signed_in?
    if user_signed_in?
      return true
    else
      redirect_to new_user_session_path
      return false
    end
  end

    def is_admin?
     if user_signed_in?
       current_user.is_admin
     else
       false
     end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_borrowablestuff
      @borrowablestuff = Borrowablestuff.find( ((params[:borrowablestuff_id]) ? (params[:borrowablestuff_id]) : (params[:id])) )
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def borrowablestuff_params
      params.require(:borrowablestuff).permit(:stufftype,
                            :stuffcode,
                            :description,
                            :image_url,
                            :max_lendingperiod,
                            :lended_period,
                            :lended_at,
                            :current_lended_user)
    end
end
