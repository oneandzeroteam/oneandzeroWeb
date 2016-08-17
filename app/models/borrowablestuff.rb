class Borrowablestuff < ApplicationRecord
  has_many :users
  validates :stufftype, presence: true
  validates :stuffcode, uniqueness: true

  def create_code # stuffencode, stuffnumbering로 코드제작, e.g. type = MONITOR -> MON01
    self.stuffstrcode = stuffencode
    self.stuffintcode = self.stuffnumbering
    self.stuffcode = stuffencode + ("%02d" % self.stuffnumbering)
    return self.save
  end

  def stuffencode
    if( (@borrowablestuff = Borrowablestuff.where(stufftype: self.stufftype).first) ) # 같은 stufftype 차용
      return @borrowablestuff.stuffstrcode
    else
      # 낯선 stufftype -> 첫 3글자로 제작, 겹칠경우 B, C ... e.g) Monitor -> Mon, Monitortype2 -> MonB
      @alphabetlength = 3;
      @duplicatecode = 'A'.bytes[0];
      while(Borrowablestuff.where("stuffstrcode = :stuffcodeCOMPARE", {stuffcodeCOMPARE: self.stufftype.first(@alphabetlength) + ((@duplicatecode == 'A'.bytes[0])? '': @duplicatecode.chr)} ).first)
        @duplicatecode = @duplicatecode + 1
      end
      return self.stufftype.first(@alphabetlength) + ((@duplicatecode == 'A'.bytes[0])? '': @duplicatecode.chr)
    end
  end

  def stuffnumbering
    Borrowablestuff.where("stuffstrcode = :stuffcodeCOMPARE", {stuffcodeCOMPARE: self.stuffstrcode} ).count + 1
  end

  def borrow(user, lended_period)
    if (canborrowuser?(user) && validperiod?(lended_period) && unborrowed?)
      self.lended_at = DateTime.now
      self.lended_period = lended_period
      self.current_lended_user_id = user.id
      return self.save
    end
  end

  def return
    self.lastest_lended_user_id = self.current_lended_user_id
    self.current_lended_user_id = nil
    @remain_period = self.remain_period
    self.lended_at = DateTime.now # 반납일시 기록
    if self.save
      return @remain_period
    else
      return false
    end 
  end

  def status(user) # View용, 순서대로 반납대상 유저, 대여가능, 대여불가(Just showstuff)
    if(self.current_lended_user_id == user.id)
      return "returnable"
    elsif(self.current_lended_user == nil)
      return "borrowable"
    else
      return "showstuffable"
    end
  end

  def borrowed?
    (self.current_lended_user_id != nil)
  end

  def current_lended_user
    User.where(:id => current_lended_user_id).first
  end

  def lastest_lended_user
    User.where(:id => lastest_lended_user_id).first
  end

  def unborrowed?
    !borrowed?
  end

  def canborrowuser?(user)
    user.is_member?
  end

  def validperiod?(lended_period)
    (lended_period <= self.max_lendingperiod)
  end

  def remain_period
    if borrowed?
      (dueday - DateTime.now.to_date)
    end
  end

  def dueday
    if borrowed?
      (lended_at.to_date + self.lended_period)
    end
  end
end
