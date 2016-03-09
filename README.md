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

2. go install MQPrototype/producer
 
Running:
0. You need to have kafka and zookeeper running as a prerequisite

1. $HOME/bin/producer -topic=test -value=test-message -brokers=localhost:9092
2. $HOME/bin/consumer -topic=test -brokers=localhost:9092
