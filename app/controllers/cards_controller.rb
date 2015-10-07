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
	  	@card.save!
	end	 

	def show
	  	@card = Card.find(params[:id])
	end

	def destroy
	end

	def update
	end

	def card_params
 		params.require(:card).permit(user_ids:[])
	end
	
end







