# lib/tasks/populate_setup.rake
namespace :populate do
  desc "Setup Database Population"
  task setup: [:currencies, :rewards]

  desc "Populate Currencies"
  task currencies: :environment do
    currencies = %w(US\ Dollar PH\ Peso Euro)
    currencies.each do |currency|
      Currency.create(name: currency)
    end
    puts "Currencies populated successfully."
  end

  desc "Populate Rewards"
  task rewards: :environment do
    rewards = %w(Free\ Coffee Free\ Movie\ Tickets 5%\ Cash\ Rebate 100\ Points Airport\ Lounge\ Access)
    rewards.each do |reward|
      Reward.create(name: reward)
    end
    puts "Rewards populated successfully."
  end
end
