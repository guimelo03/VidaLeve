require "twilio-ruby"

module Whatsapp
  module Providers
    class TwilioProvider
      def send_message(to:, message:)
        client.messages.create(
          from: ENV.fetch("TWILIO_WHATSAPP_NUMBER"),
          to: "whatsapp:#{to}",
          body: message
        )
      end

      private

      def client
        @client ||= Twilio::REST::Client.new(
          ENV.fetch("TWILIO_ACCOUNT_SID"),
          ENV.fetch("TWILIO_AUTH_TOKEN")
        )
      end
    end
  end
end
