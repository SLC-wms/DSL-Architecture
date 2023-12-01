!ref configs {
    view = container "Control Panel" "Dashboard" "" "Desktop" {
        admin -> this "Make changes with"
    }
    users = container "HHRR Wrapper" "Microservice" "" "Container"
    container "HHRR Database" "SQL Database" "" "Database" {
        users -> this "Manages the data"
    }
    update = container "Config Wrapper" "Microservice" "" "Container" {
        -> database.system "Change the configuration" "Message Broker"
        -> analytics.scheduled "Update schedule" "HTTPS Request"
        -> inventory.scheduled "Update schedule" "HTTPS Request"
        -> inventory.supplier "Update supply rules" "HTTPS Request"
    }
    backend = container "Schema Validation" "Microservice" "" "Container" {
        -> users "Add or update an employee" "HTTPS Request"
        -> update "Change the configuration" "HTTPS Request"
    }
    container "Authentication" "Firewall" "" "Container" {
        view -> this "Sends the changes" "HTTPS Request"
        -> backend "Redirects"
    }
}