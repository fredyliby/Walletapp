class Card < ActiveRecord::Base
	has_many :users,   :through => :usercards
	has_many :usercards


  # validates :users, presence: true

	# validates :card_number, format: { with: /\d{4}-\d{4}-\d{4}-\d{4}/}
 #  validates :expiration_month, inclusion: {in: (1..12)}
 #  validates :expiration_year, inclusion: {in: (2015..2115)}

  # before_save :set_card_type, :set_expiration_date

  def set_expiration_date
    self.expiration_date = DateTime.new(self.expiration_year,
      self.expiration_month,
      28)
  end

  scope :expired, lambda { where('expiration_date < ?', Time.now) }




end
