!ref reception {
    view = container "Reception Form" "Responsive App" "" "Desktop" {
        receiver -> this "Fills a form"
    }
    backend = container "Schema Validation" "Microservice" "" "Container" {
        -> database.inventory "Sends new values" "Message Broker"
    }
    container "Authentication" "Firewall" "" "Container" {
        view -> this "Sends the form" "HTTPS Request"
        -> backend "Redirects"
    }
}