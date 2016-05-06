require 'celluloid/current'
require 'kafka'

module KafkaCell
  class Consumer
    include Celluloid

    def initialize(kafka, group_id, topics)
      @consumer = kafka.consumer(group_id: group_id)

      topics.each do |topic|
        @consumer.subscribe(topic)
      end

      async.fetch(consume)
    end

    private

    # @param [Proc] block that should be executed for each incoming message
    def fetch(block)
      @consumer.each_message do |message|
        block.call(message)
      end
    end

    # @return [Proc] proc that should be processed when a message arrives
    # @yieldparam message [Kafka::FetchedMessage] message from poseidon (raw one)
    def consume
      lambda do |message|
        workers_pool.async.perform(message)
      end
    end

    def workers_pool
      @workers_pool ||= Worker.pool
    end
  end
end
