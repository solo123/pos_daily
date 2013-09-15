class UsersController < ResourcesController
  def add
    params.permit!
    @object = User.new(params[:user])
    if @object.save
      redirect_to users_path
      return
    else
      flash[:error] = @object.errors.full_messages.to_sentence
      @no_log = 1
    end
    render :new
  end
  def add_merchant
    @object = User.find(params[:id])
    @object.merchants << Merchant.find(params[:merchant_id])
  end
  def del_merchant
    @object = User.find(params[:id])
    m = Merchant.find(params[:merchant_id])
    m.user = nil
    m.save
  end
end

