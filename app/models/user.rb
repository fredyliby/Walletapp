class User < ActiveRecord::Base
	has_many :usercards
	has_many :cards, :through => :usercards 

	validates :email, uniqueness: true
	validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/}
	validates :first_name, presence: true 
	validates :last_name, presence: true
	# validates :price, :presence => true, :numericality => { :greater_than => 0 }

	before_destroy :destroy_solely_owned_cards

	def destroy_solely_owned_cards
		all_my_cards = self.cards
		owned_cards = all_my_cards.select do |card|
			card.users.length ==1
			owned_cards.each & :destroy!
		end

	end



end
