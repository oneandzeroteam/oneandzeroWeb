class Borrowablestuff < ApplicationRecord
  has_many :users

  validates :stufftype, presence: true
  validates :stuffcode, uniqueness: true

  def create_code
    self.stuffcode = stuffencode + stuffnumbering.to_s # todo 1-> 01
    return self.save
  end

  def stuffencode
    if(@borrowablestuff = Borrowablestuff.find(stufftype: self.stufftype))
      return @borrowablestuff.stuffcode
    else
      @alphabetlength = 3;
      while(Borrowablestuff.find(:stuffcode.last(@alphabetlength) => self.stufftype.first(@alphabetlength)))
        @alphabetlength = @alphabetlength+1
      end
      return self.stufftype.first(@alphabetlength)
    end
  end

  def stuffnunbering
    1#todo Borrowablestuff.where(stuffcode: => stuffencode).개수 + 1
  end

  def borrow(user, lended_period)
    if (canborrow?(user) && validperiod?(lended_period))
     self.lended_at = DateTime.beginning_of_day
      self.lended_period = lended_period
      self.current_lended_user = user
      return self.save
    end
  end

  def return
    self.lastest_lended_user = self.current_lended_user
    self.current_lended_user = nil
    @remain_period = self.remain_period
    self.lended_at = DateTime.beginning_of_day
    if self.save
      return @remain_period
    else
      return false
    end 
  end

  def canborrowuser?(user)
    user.is_member?
  end

  def validperiod?(lended_period)
    (lended_period <= self.max_lendingperiod)
  end

  def remain_period
  (self.lended_period - self.lended_at.since(DateTime.beginning_of_day)/60/60/24)
  # Seconds /60/60/24 -> Days
  end
end
