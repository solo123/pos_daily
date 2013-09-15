class MyTradesController < ApplicationController
  def index
    dt = Date.today
    dt = "#{params[:trade_month]}-01".to_date if params[:trade_month]
    dt_e = dt.next_month
    @collection = Trade.where(trade_date: dt..dt_e)
    unless current_user.roles.index('admin')
      @collection = @collection.where(merchant_number: current_user.merchants.map{|m| m.merchant_number})
      @month_collection = Trade.where(merchant_number: current_user.merchants.map{|m| m.merchant_number}).select('substr(trade_date, 1, 7) td').distinct
    end
  end
end

