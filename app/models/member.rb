class Member < ApplicationRecord
  LIMIT_MEMBERS = 20

  belongs_to :poker, optional: true

  validates :name, presence: true, uniqueness: { scope: :poker_id }, length: { maximum: 18 }
  validate :limit_scrum_members

  after_commit { PokerMemberJob.perform_later(self) }

  def update_with_omniauth(info)
    update(name: info['name'], email: info['email'], master: true)
    poker = Poker.find_or_initialize_by(members: [self])
    poker.save
  end

  private

  def limit_scrum_members
    errors.add(:too_much, I18n.t('too_much_member', limit: LIMIT_MEMBERS)) if poker&.members&.count.to_i >= LIMIT_MEMBERS
  end
end
