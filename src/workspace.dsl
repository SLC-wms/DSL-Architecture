workspace "SLC-wms" {
    !docs ./descriptions
    !identifiers hierarchical

    model {
        properties {
            "structurizr.groupSeparator" "/"
        }

        !include ./wms-references.dsl
        !include ./systems/database.dsl
        !include ./systems/missions.dsl
        !include ./systems/inventory.dsl
        
        !include ./systems/analytics/relations.dsl
        !include ./systems/layout/relations.dsl
        !include ./systems/shipping/relations.dsl
        !include ./systems/picking/relations.dsl
        !include ./systems/reception/relations.dsl
        !include ./systems/configs/relations.dsl
    }

    views {
        !include ./deploy-feats.dsl
        systemlandscape "SystemLandscape" "" {
            include *
            autoLayout tb
        }

        !include ./systems/display.dsl
        !include ./systems/analytics/display.dsl
        !include ./systems/configs/display.dsl
        !include ./systems/layout/display.dsl
        !include ./systems/shipping/display.dsl
        !include ./systems/picking/display.dsl
        !include ./systems/reception/display.dsl

        styles {
            !include ./wms-theme.dsl
        }
    }
}