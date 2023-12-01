!ref analytics {
    view = container "Analytics View" "Responsive App" "" "Desktop" {
        analyst -> this "Watches the performance"
    }
    wrapper = container "Analytics Wrapper" "Microservice" "" "Container"
    container "Analytics Data" "SQL Database" "" "Database" {
        wrapper -> this "Manages the data"
    }
    scheduled = container "Statistics Calculator" "Scheduled" "" "Container" {
        database -> this "Retrieves the data" "Message Broker"
        missions.wrapper -> this "Retrieves the data" "Message Broker"
        -> wrapper "Sends the results" "Message Broker"
    }
    backend = container "Schema Validation" "Microservice" "" "Container" {
        -> wrapper "Retrieves the data" "Message Broker"
    }
    container "Authentication" "Firewall" "" "Container" {
        view -> this "Request the data" "HTTPS Request"
        -> backend "Redirects"
    }
}