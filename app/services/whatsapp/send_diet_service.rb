module Whatsapp
  class SendDietService
    def initialize(diet)
      @diet = diet
      @user = diet.user
    end

    def call
      provider.send_message(
        to: formatted_phone,
        message: formatted_message
      )
    end

    private

    attr_reader :diet, :user

    def provider
      @provider ||= Whatsapp::Providers::TwilioProvider.new
    end

    def formatted_phone
      "+55#{user.phone.gsub(/\D/, '')}"
    end

    def formatted_message
      lines = []

      lines << "🍽️ *#{diet.title}*"
      lines << ""

      diet.meals.each do |meal|
        lines << "📌 *#{meal.name}*"

        meal.meal_items.each do |item|
          lines << "- #{item.name}: #{item.quantity}"
        end

        lines << ""
      end

      lines.join("\n")
    end
  end
end
