!ref missions {
    wrapper = container "Mission Wrapper" "Microservice" "" "Container"
    container "Mission History" "NoSQL Database" "" "Database" {
        wrapper -> this "Manages the data"
    }
    disp = container "Mission Dispatcher" "Microservice" "" "Container" {
        -> database.orders "Updates the status" "Message Broker"
        -> wrapper "Retrieves a mission" "Message Broker" 
    }
    comp = container "Mission Completer" "Microservice" "" "Container" {
        -> database.inventory "Updates the status" "Message Broker"
        -> wrapper "Completes a mission" "Message Broker"
        -> disp "Request new mission" "Message Broker"
    }
}