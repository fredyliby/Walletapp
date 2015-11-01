class Card < ActiveRecord::Base
	has_many :users,   :through => :user_cards
	has_many :user_cards
  validates :number, :uniqueness => true


  validates :users, presence: true

	validates :number, format: { with: /\d{4}-\d{4}-\d{4}-\d{4}/}
  validates :month, inclusion: {in: (1..12)}
  validates :year, inclusion: {in: (2015..2115)}

  # before_save :set_card_type, :set_expiration_date

  def set_expiration_date
    self.expiration_date = DateTime.new(self.expiration_year,
      self.expiration_month,
      28)
  end

  scope :expired, lambda { where('expiration_date < ?', Time.now) }




end
