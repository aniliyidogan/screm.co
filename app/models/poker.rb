class Poker < ApplicationRecord
  has_many :members
  has_many :choose_cards

  before_create :generate_pin_code

  def regenerate_pin_code
    generate_pin_code
    save
  end

  private

  def generate_pin_code
    loop do
      self.pin_code = Random.new.rand(100_000..999_999)
      next if Poker.exists?(pin_code: pin_code)
      break
    end
  end
end
