FROM confluentinc/cp-kafka-connect:latest

# Copy the custom connector JAR
COPY ./target/my-kafka-connector-1.0.jar /usr/share/java/my-kafka-connector/

# Base Image: 
#   Start with a base image for Kafka Connect. 
#   You can use the official images provided by Confluent or another trusted source.
# Compile Connector:  
#   When preparing your connector for deployment, it is crucial to compile it into an uber or fat jar. 
#   This type of jar file includes not only your compiled code but also all the necessary dependencies in a single package. 
#   This approach ensures that all required libraries are available at runtime, avoiding classpath issues.
# Adding Your Connector: 
#   You need to add your custom connector to the Kafka Connect image. 
#   This is typically done by copying the JAR file of your connector into the Kafka Connect's plugins directory in the Docker image. 
# Building FAT jar: add to pom.xml for Maven
# <plugin>
#   <artifactId>maven-assembly-plugin</artifactId>
#   <configuration>
#     <descriptorRefs>
#       <descriptorRef>jar-with-dependencies</descriptorRef>
#     </descriptorRefs>
#     <archive>
#       <manifest>
#         <mainClass>YourMainClass</mainClass>
#       </manifest>
#     </archive>
#   </configuration>
#   <executions>
#     <execution>
#       <id>make-assembly</id>
#       <phase>package</phase>
#       <goals>
#         <goal>single</goal>
#       </goals>
#     </execution>
#   </executions>
# </plugin>
# Run the connector: 
#   Run the `docker-compose up -d --build` and make sure all the services are up and running 
#   Once Kafka Connect is running, you can use its REST API to configure and manage connectors. 
#   You'll need to POST a JSON configuration to Kafka Connect's REST endpoint to create and configure your connector.
# Instantiate the connector: 
#   curl --location 'http://localhost:8083/connectors' \
#    --header 'Content-Type: application/json' \
#    --data '{
#        "name": "ServiceNowSourceConnector",
#        "config": {
#            "connector.class": "io.confluent.connect.servicenow.ServiceNowSourceConnector",
#            "kafka.topic": "topic-servicenow",
#            "servicenow.url": "https://<endpoint>.service-now.com/",
#            "tasks.max": "1",
#            "servicenow.table": "<table_name>",
#            "servicenow.user": "<username>",
#            "servicenow.password": "<password>",
#            "servicenow.since": "2019-01-01",
#            "key.converter": "org.apache.kafka.connect.json.JsonConverter",
#            "value.converter": "org.apache.kafka.connect.json.JsonConverter",
#            "confluent.topic.bootstrap.servers": "<server hostname>:9092",
#            "confluent.license": "<license>", 
#            "poll.interval.s": "10",
#            "confluent.topic.replication.factor": "1"
#        }
#    }'
#
