class ReportsController < ApplicationController
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
end




