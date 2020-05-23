require 'telegram/bot'
require 'faker'
require_relative 'secret/secrets'

Telegram::Bot::Client.run(Secrets::TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start', '/start start'
      bot.api.send_message(
          chat_id: message.chat.id,
          text: "Hi, #{message.from.first_name}"
      )
    else
      bot.api.send_message(
          chat_id: message.chat.id,
          text: Faker::Movie.quote
      )
    end
  end
end