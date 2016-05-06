require 'celluloid/current'

module KafkaCell
  # Class that consumes messages for which we listen
  class Worker
    include Celluloid

    def initialize
      puts "New worker... #{inspect}"
    end

    # @param message [Kafka::FetchedMessage] a message
    def perform(message)
      puts "MESSAGE: #{message.inspect}"
    rescue => e
      puts "ERROR: #{e}"
    end
  end
end
