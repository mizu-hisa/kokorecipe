class Public::User::SessionsController < ApplicationController
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path(customer), notice: 'ゲスト(閲覧用)でログインしました。'
  end
end
