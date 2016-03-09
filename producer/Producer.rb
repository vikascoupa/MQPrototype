# prerequisite: gem install ruby-kafka
$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))

require "kafka"
require 'optparse'
require 'ostruct'

options = OpenStruct.new
OptionParser.new do |opt|
  opt.on('-t', '--topic TOPIC', 'The topic name') { |o| options.topic = o }
  opt.on('-b', '--brokers BROKER', Array, 'Comma separated broker list - broker:port[,broker2:port] ') { |o| options.brokers = o }
end.parse!

if not (options.brokers and options.topic)
    puts "Usage: #{$0} --topic=topicname --brokers=broker1:port[,broker2:port]"
    exit 0
end

logger = Logger.new($stderr)
logger.level = Logger::INFO

# Make sure to create this topic in your Kafka cluster or configure the
# cluster to auto-create topics.

kafka = Kafka.new(
  seed_brokers: options.brokers,
  client_id: "simple-producer",
  logger: logger,
)

producer = kafka.producer

begin
  $stdin.each_with_index do |line, index|
    producer.produce(line, topic: options.topic)

    # Send messages for every 10 lines.
    producer.deliver_messages if index % 10 == 0
  end
ensure
  # Make sure to send any remaining messages.
  producer.deliver_messages
  producer.shutdown
end
