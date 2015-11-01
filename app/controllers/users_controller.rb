class UsersController < ApplicationController
  def index
    # redirect_to new_session_path unless current_user
    @users = User.all
  end

  def create
  	@user = User.create (user_params)
    if @user.valid?
      flash[:notice] = "Thank you for signing up"
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:alert] = "There was a problem."
      render :new
    end 
  end
    def new
     @user = User.new
   end

   def addcard
    user_card = params[:user_card]
    user = params[:user_id]
    card = user_card[:card_id]
    if @user = User.find(user)
      flash[:notice] = "ADDED CARD"
      @user.cards << Card.find(card)
      # @user.cards.uniq{|x| x.id}

    end
     redirect_to @user
   end

   def show
     @user = User.find params[:id]
   end


   def edit

   end


   def update

    @user = User.find params[:id]

    p = user_params

    if user_params[:password].blank?
      p.delete(:password)
      p.delete(:password_confirmation)
    end

    @user.update! p

    flash[:notice] = "Successful update"
    redirect_to user_path(@user)
  end



  def destroy
    @user = User.find params[:id]
    @user.destroy!
    session.clear
    flash[:notice] = "Bye."
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email, :phone, :first_name, :last_name, :card_balance)
  end


end

