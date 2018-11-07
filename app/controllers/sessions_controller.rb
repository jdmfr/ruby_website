class SessionsController < ApplicationController
  before_action :forbid_login_again, only:[:new,:create]


  def new
  end

  def create
  	user= User.find_by(name: params[:name])
  	if user.try(:authenticate,params[:password])
  		session[:user_id]=user.id
      session[:username]=user.name
      if session[:user_id]=1
        session[:admin]= true
        else
        session[:admin]= false 
      end
  		redirect_to root_url
  	else
  		redirect_to login_url , alert:"user/password wrong"
  	end
  end

  def destroy
  	session[:user_id]=nil
  	redirect_to root_url, notice:"logged out success"
  end



  private 
      def signed_in 
        !session[:user_id].nil?
      end

      def forbid_login_again
        if signed_in 
          redirect_to  root_url ,notice: "you have already logged in"
        end
      end

end
