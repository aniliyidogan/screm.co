namespace :ping do
  desc 'Ping for heroku'
  task hello: :environment do
    HTTParty.get('http://screm.co/ping')
  end
end
