class CardsController < ApplicationController
	
	def index
		if params[:user_id].present?
			@user = User.find params[:user_id]
			@cards = @user.cards
		else
			@cards = Card.all
		end	      
	end


	def new
		@card = Card.new
	end

	def create
		@card = Card.new(card_params)

		if @card.valid?
			@card.save!
			@card.users << current_user	
			redirect_to cards_path
		else
			flash[:alert] = "Problem with card: #{@card.errors.full_messages.first}"
			render 'new'
		end

	end	 

	def show
		@card = Card.find(params[:id])
			
	end

	def destroy
	end

	def update
	end

	private

	def card_params
		params.require(:card).permit(:number, :expiration, :month, :year, )
	end

end







