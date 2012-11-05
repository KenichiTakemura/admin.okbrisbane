class StatisticsController < ApplicationController
  def hit_counter
    status = params[:status]
    case status
    when Okvalue::SITE_STATISTICS_DAILY
      @hits_last_month = DailyHit.month_for(Common.last_month)
      @hits = DailyHit.month_for(Common.this_month)
    when Okvalue::SITE_STATISTICS_MONTHLY
      @hits_last_month = Array.new
      @hits = MonthlyHit.all
    end
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def most_clicked
    
  end
end
