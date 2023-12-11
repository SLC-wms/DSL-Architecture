!ref database {
    inventory = container "Inventory Wrapper" "Microservice" "" "Container"
    container "Inventory Units" "SQL Database" "" "Database" {
        inventory -> this "Manages the data"
    }

    orders = container "Orders Wrapper" "Microservice" "" "Container"
    container "Orders History" "NoSQL Database" "" "Database" {
        orders -> this "Manages the data"
    }

    system = container "System Wrapper" "Microservice" "" "Container"
    container "System Manifest" "NoSQL Database" "" "Database" {
        system -> this "Manages the data"
    }
}