module Whatsapp
  class SendDietJob
    include Sidekiq::Job

    sidekiq_options retry: 5

    def perform(diet_id)
      diet = Diet.find(diet_id)

      Whatsapp::SendDietService.new(diet).call
    end
  end
end
