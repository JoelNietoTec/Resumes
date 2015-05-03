#encoding: UTF-8
class SessionsController < ApplicationController

  before_action :set_user, only: [:create]
  before_action :require_login, only: [:destroy]

  def new
  end

  def create
    if @user
      if @user.is_candidate?
        redirect_to root_url, :success => "Sesión Iniciada"
      elsif @user.is_company
        redirect_to company_root_url, :success => 'Bienvenido'
      end
    else
      redirect_to :back, :alert => 'Email y/o password incorrectos'
    end
  end
  def destroy
    logout
    redirect_to root_url, :notice => 'Sesión Finalizada'
  end

  private
  def set_user
    @user = login(params[:sessions][:email], params[:sessions][:password])
  end

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
