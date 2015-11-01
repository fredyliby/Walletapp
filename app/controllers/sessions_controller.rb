class SessionsController < ApplicationController
	def create
       user = User.find_by_email(params[:email])
       if user.password == params[:password]
        session[:user_id] = user.id
        flash[:welcome] = "valid Information"
        redirect_to user_path (user.id)
       else
      flash[:alert] = "Invalid Informations"
      redirect_to new_session_path
       end
  end

 def destroy
 	  session.clear
      flash[:notice] = "Logged Out"
      redirect_to root_path
  end

end




