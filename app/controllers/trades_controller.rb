class TradesController < ResourcesController
  def import
    data = params[:import_text]
    lines = data.split(/\n/)
    imp_lines = 0
    lines.each do |line|
      cs = line.split(/[\t\s]/)
      if cs.length>10 && cs[5].to_i > 0
        b = Trade.new
        b.merchant_number = cs[0]
        b.merchant_name = cs[1]
        b.agent_number = cs[2]
        b.agent_name = cs[3]
        b.terminal_number = cs[4]
        b.biz_count = cs[5].to_i
        b.amount = cs[6].to_f
        b.commission = cs[7].to_f
        b.actual_amount = cs[8].to_f
        b.base_commission = cs[9].to_f
        b.profit = cs[10].to_f
        b.status = 0
        imp_lines += 1
        b.save
      end
    end
    flash[:notice] = "导入#{imp_lines}行数据。"
  end

  private
    def trade_params
      params.require(:trade).permit(:trade_date, :merchant_number, :merchant_name, :agent_number, :agnet_name, :terminal_number, :biz_count, :amount, :commission, :actual_amount, :base_commission, :profit, :status)
    end
end
