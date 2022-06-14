class Public::CustomersController < ApplicationController

  before_action :ensure_guest_user, only: [:edit]

  def show
    @customer = Customer.find(current_customer.id)
    @recipes = @customer.recipes
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end

  def withdrawal
    @customer = Customerer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:customer_name, :profile_image)
  end

  def ensure_guest_user
    @customer = Customer.find(params[:id])
    if @customer_id == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end


end
