#!/bin/bash

# Array of microservices directories
microservices=("services/comments" 
                "services/posts" 
                "services/client"  
                "services/event-bus"  
                "services/moderation"
                "services/query"  )

# Function to start a Node.js microservice
start_microservice() {
  cd "$1" || exit
  npm start     # Replace with your actual start command
  cd ../..
}

# Iterate through microservices and start each one
for service in "${microservices[@]}"; do
  start_microservice "$service" &
done

# Wait for all background processes to finish
wait
