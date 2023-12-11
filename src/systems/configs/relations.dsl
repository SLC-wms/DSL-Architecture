!ref configs {
    view = container "Control Panel" "Dashboard" "" "Desktop" {
        admin -> this "Make changes with"
    }
    users = container "HHRR Wrapper" "Microservice" "" "Container"
    container "HHRR Database" "SQL Database" "" "Database" {
        users -> this "Manages the data"
    }
    update = container "Config Updater" "Microservice" "" "Container" {
        -> database.system "Change the configuration" "Message Broker"
        -> analytics.scheduled "Update schedule" "HTTPS Request"
        -> inventory.scheduled "Update schedule" "HTTPS Request"
        -> reception.scheduled "Update schedule" "Message Broker"
        -> inventory.supplier "Update supply rules" "HTTPS Request"
    }
    notification = container "Notification Emitter" "Microservice" "" "Container"
    backend = container "Schema Validation" "Microservice" "" "Container" {
        -> users "Add or update an employee" "HTTPS Request"
        -> update "Change the configuration" "HTTPS Request"
        -> notification "Request the delivery" "Message Broker"
    }
    container "Authentication" "Firewall" "" "Container" {
        view -> this "Sends the changes" "HTTPS Request"
        -> backend "Redirects"
    }
}