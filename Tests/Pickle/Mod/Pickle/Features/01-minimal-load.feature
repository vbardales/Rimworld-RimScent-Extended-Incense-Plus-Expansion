Feature: RimScent Incense Plus Expansion loads with its hard dependencies

  Scenario: the minimal dependency set loads every owned aroma definition
    Given the save "test-colony" is loaded
    Then mod "nelim.rimscent.extended.incenseplus" is loaded
    And def "RimScentExtended_IncenseCrafting" of type "ResearchProjectDef" exists
    And def "RimScentExtended_AromaticIncense" of type "ResearchProjectDef" exists
    And def "RimScentExtended_Burner_Sandalwood" of type "ThingDef" exists
    And def "RimScentExtended_Burner_Frankincense" of type "ThingDef" exists
    And def "RimScentExtended_Burner_Psychoid" of type "ThingDef" exists
    And def "RimScentExtended_Burner_Smokeleaf" of type "ThingDef" exists
    And def "RimScentExtended_Burner_Berry" of type "ThingDef" exists
    And def "RimScentExtended_Burner_Cocoa" of type "ThingDef" exists
    And def "RimScentExtended_Aroma_Sandalwood" of type "HediffDef" exists
    And def "RimScentExtended_Aroma_Frankincense" of type "HediffDef" exists
    And def "RimScentExtended_Aroma_Psychoid" of type "HediffDef" exists
    And def "RimScentExtended_Aroma_Smokeleaf" of type "HediffDef" exists
    And def "RimScentExtended_Aroma_Berry" of type "HediffDef" exists
    And def "RimScentExtended_Aroma_Cocoa" of type "HediffDef" exists
    And no errors were logged
