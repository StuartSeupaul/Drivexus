class Cohort < ActiveRecord::Base
  def end_display
    mytime = self.end_date
    mytime.strftime("%B %-d, %Y")
  end

  def start_display
    mytime = self.start_date
    mytime.strftime("%B %-d, %Y")
  end
end
