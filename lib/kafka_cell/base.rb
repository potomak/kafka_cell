module KafkaCell
  class Base
    def initialize(seed_brokers:)
      @kafka = Kafka.new(seed_brokers: seed_brokers)
    end

    def run(group_id:, topics:)
      kafka = @kafka

      supervisor_class = Class.new(Celluloid::Supervision::Container) do
        supervise type: KafkaCell::Consumer, args: [kafka, group_id, topics]
      end

      puts 'Starting consumer...'
      supervisor_class.run
    end
  end
end
