class MyTradesController < ApplicationController
  def index
		if current_user.roles.index('admin')
			redirect_to controller: :trades, action: :index
			return
		end
    dt = Date.today.at_beginning_of_month
    dt = "#{params[:trade_month]}-01".to_date if params[:trade_month]
    dt_e = dt.next_month
    @collection = Trade.where(trade_date: dt..dt_e).where(merchant_number: current_user.merchants.map{|m| m.merchant_number}).order('id desc')
    @month_collection = Trade.order('trade_date desc, merchant_number').where(merchant_number: current_user.merchants.map{|m| m.merchant_number}).select('substr(trade_date, 1, 7) td').distinct
  end
end

