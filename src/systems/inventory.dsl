!ref inventory {
    scheduled = container "Cycle Counting" "Scheduled" "" "Container" {
        -> missions.wrapper "Create counting missions" "Message Broker"
    }
    supplier = container "Supplier" "Microservice" "" "Container" {
        -> missions.wrapper "Create supplying missions" "Message Broker"
    }
    ordering = container "Mission Generator" "Microservice" "" "Container" {
        database -> this "Retrieve Layout and Units" "Message Broker"
        -> missions.wrapper "Create a picking mission" "Message Broker"
        -> supplier "Send the leftovers" "Message Broker"
    }
    backend = container "Schema Validation" "Microservice" "" "Container" {
        -> database.orders "Sends the order" "Message Broker"
        -> ordering "Request units" "Message Broker"
    }
    container "Authentication" "Firewall" "" "Container" {
        ecommerce -> this "Sends the order" "HTTPS Request"
        -> backend "Redirects"
    }
}