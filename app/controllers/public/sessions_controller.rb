# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :prohibit_multiple_login, if: :admin_signed_in?
  before_action :is_active?, only: [:create]

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  # ユーザー登録していたら下記の処理
  def is_active?
    @user = User.find_by(email: params[:user][:email])
    return unless @user && @user.valid_password?(params[:user][:password]) && @user.is_active
  
    # ログイン成功時の処理
    # セッションにユーザーIDを保存
    session[:user_id] = @user.id 
    # ログイン後のデフォルトページにリダイレクトする
    redirect_to root_path 
  end


  def prohibit_multiple_login
    redirect_to admin_root_path
  end
end
