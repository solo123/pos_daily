class ReportsController < ApplicationController
	layout "no_layout", except: [:index]
	def monthly
		@results = Trade.all(
			:select => "trade_date, sum(biz_count) biz_count, sum(amount) amount, sum(profit) profit",
			:group => "strftime('%m', trade_date)",
			:conditions => {:status => 1},
			:order => 'trade_date desc')
	end
	def daily
		@results = Trade.all(
			:select => "trade_date, sum(biz_count) biz_count, sum(amount) amount, sum(profit) profit",
      :group => "strftime('%m-%d', trade_date)",
			:conditions => {:status => 1},
			:order => 'trade_date desc')
	end
	def agents
		@start_date = Date.today.at_beginning_of_month
  	@end_date = Date.today.next_month.at_beginning_of_month - 1
		@start_date = params[:start_date].to_date if params[:start_date]
		@end_date = params[:end_date].to_date if params[:end_date]
	end
end




