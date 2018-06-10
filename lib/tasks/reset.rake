namespace :reset do
  desc 'Reset all pokers and members'
  task all: :environment do
    Poker.where('updated_at < ?', Time.current.yesterday).find_each do |poker|
      poker.choose_cards.destroy_all
      poker.members.destroy_all
      poker.destroy
    end
  end
end
