!ref layout {
    view = container "Layout Builder" "Desktop App" "" "Desktop" {
        layouter -> this "Creates or modifies layout"
    }
    backend = container "Schema Validation" "Microservice" "" "Container" {
        -> database.system "Sends new layout" "HTTPS Request"
    }
    moving = container "Mission Generation" "Microservice" "" "Container" {
        backend -> this "Sends new layout" "HTTPS Request"
        -> missions "Sends updates required" "Message Broker"
    }
    container "Authentication" "Firewall" "" "Container" {
        view -> this "Sends new layout" "HTTPS Request"
        -> backend "Redirects"
    }
}