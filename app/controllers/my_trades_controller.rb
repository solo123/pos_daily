class MyTradesController < ApplicationController
  def index
    dt = Date.today.at_beginning_of_month
    dt = "#{params[:trade_month]}-01".to_date if params[:trade_month]
    dt_e = dt.next_month - 1

		params[:q] ||= {}
		@q = Trade.search(params[:q])
		u = nil
		if current_user.admin?
			u = User.find(session[:mock_user]) if session[:mock_user]
		else
  		u = current_user
		end
		mer_numbers = []
  	mer_numbers =  u.agent_merchants.map{|m| m.merchant_number} if u
    @collection = @q.result.where(trade_date: dt..dt_e).where(merchant_number: mer_numbers).order('trade_date desc, id desc')
    @month_collection = Trade.order('trade_date desc, merchant_number').where(merchant_number: mer_numbers).select('substr(trade_date, 1, 7) td').distinct
  end
end

