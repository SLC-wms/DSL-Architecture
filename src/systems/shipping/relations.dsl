!ref shipping {
    view = container "Shipping View" "Responsive App" "" "Mobile" {
        packer -> this "Finishes orders"
    }
    feed = container "Order Feed" "Microservice" "" "Container" {
        -> database.orders "Retrieve orders" "Message Broker"
    }
    comp = container "Complete Picking" "Microservice" "" "Container" {
        -> missions.comp "Accepts completion" "Message Broker"
    }
    backend = container "Schema Validation" "Microservice" "" "Container" {
        -> comp "Completion request" "HTTPS Request"
        -> feed "Check pending orders" "Message Broker"
    }
    container "Authentication" "Firewall" "" "Container" {
        view -> this "Sends the form" "HTTPS Request"
        -> backend "Redirects"
    }
}