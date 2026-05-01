module Whatsapp
  module Providers
    class EvolutionProvider
      def send_message(to:, message:)
        response = HTTParty.post(
          endpoint,
          headers: headers,
          body: payload(to, message).to_json
        )

        Rails.logger.info(response.body)

        response
      end

      private

      def endpoint
        "#{ENV['EVOLUTION_URL']}/message/sendText/#{ENV['EVOLUTION_INSTANCE']}"
      end

      def headers
        {
          "Content-Type" => "application/json",
          "apikey" => ENV["EVOLUTION_API_KEY"]
        }
      end

      def payload(to, message)
        {
          number: to,
          text: message
        }
      end
    end
  end
end
