class ChooseCard < ApplicationRecord
  belongs_to :card
  belongs_to :poker
  belongs_to :member
end
