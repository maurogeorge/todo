Jumpup::Heroku.configure do |config|
  config.app = 'todo'
end if Rails.env.development?