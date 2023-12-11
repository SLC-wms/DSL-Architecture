// Users
operations = group "Operation Employees" {
    receiver = person "Receiving Employee" "" "Employee"
    picker = person "Picking Employee" "" "Employee"
    packer = person "Packing Employee" "" "Employee"
}

// Stakeholders with privileges
managers = group "Operation Managers" {
    admin = person "Administrator" "" "Employee"
    analyst = person "Logistic Analyst" "" "Employee"
    layouter = person "Layout Manager" "" "Employee"
}

// Modules without front-end
database = softwareSystem "Database Module" "" "Context"
missions = softwareSystem "Missions Module" "" "Context"
inventory = softwareSystem "Inventory Module" "" "Context"

// Modules with front-end
reception = softwareSystem "Reception Module" "" "Context"
layout = softwareSystem "Layout Module" "" "Context"
picking = softwareSystem "Picking Module" "" "Context"
shipping = softwareSystem "Shipping Module" "" "Context"
analytics = softwareSystem "Analytics Module" "" "Context"
configs = softwareSystem "Configurations Module" "" "Context"

// External systems
ecommerce = softwareSystem "E-Commerce" "(or equivalent)" "External System"
