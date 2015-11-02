class Card < ActiveRecord::Base
	has_many :users,   :through => :user_cards
	has_many :user_cards
  validates :number, :uniqueness => true



	validates :year, inclusion: {in: (2015..2115)}
  # validates_format_of :number, with: '/^3[47][0-9]{13}$/'
  # /\A[345]\d{11,}\Z/
  validates :number, length: { is: 16 }

  validates :month, inclusion: {in: (1..12)}
  
  # before_save :set_card_type, :set_expiration_date

  def set_expiration_date
    self.expiration_date = DateTime.new(self.expiration_year,
      self.expiration_month,
      28)
  end

  scope :expired, lambda { where('expiration_date < ?', Time.now) }




end
