!ref picking {
    view = container "Picking Companion" "Mobile App" "" "Mobile" {
        picker -> this "Navigates with"
        // add components
    }
    comp = container "Mission Completion" "Microservice" "" "Container" {
        missions.disp -> this "Send a new mission" "Message Broker"
    }
    req = container "Shipping Validation" "Microservice" "" "Container" {
        -> shipping.comp "Ask for validation" "Message Broker"
    }
    backend = container "Schema Validation" "Microservice" "" "Container" {
        -> req "Completion request" "Message Broker"
        -> comp "Request new mission" "Message Broker"
    }
    container "Authentication" "Firewall" "" "Container" {
        view -> this "Sends the form" "HTTPS Request"
        -> backend "Redirects"
    }
}

