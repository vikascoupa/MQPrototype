# MQPrototype
Installation:

Example installation for development

1. Create a src directory in your home folder $HOME/src
2. Set the environment variable
3. export GOPATH=$HOME
4. cd $HOME/src
5. git clone https://github.com/vikascoupa/MQPrototype
6. cd $HOME/src/MQPrototype

Compilation:

1. go install MQPrototype/producer
2. go install MQPrototype/consumer
 
Running:

0. You need to have kafka and zookeeper running as a prerequisite(see below)
1. $HOME/bin/producer -topic=test -value=test-message -brokers=localhost:9092
2. $HOME/bin/consumer -topic=test -brokers=localhost:9092

Kafka Setup:

Start by downloading the Kafka tarball from here -
http://kafka.apache.org/downloads.html
untar it and you're ready to go.

Start Zookeeper:
bin/zookeeper-server-start.sh config/zookeeper.properties

Now start the Kafka server:
bin/kafka-server-start.sh config/server.properties

