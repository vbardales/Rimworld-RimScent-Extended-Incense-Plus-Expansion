# ChatGPT suggestions refused

One line per refusal: key or text | proposal | reason | date.

- Aromas_Items.xml and Aromas_Thoughts.xml, `RimScentExtended_Incense_Frankincense` and `RimScentExtended_Scent_Frankincense` labels "frankincense incense" | shorten to "frankincense" | kept on purpose: every aroma item and thought uses the "<aroma> incense" label pattern (sandalwood incense, cocoa incense...), and the thought label names the incense, not the resin | 2026-11-12
- TRANSLATION_REVIEW.md, 15 `RimScent_*` French entries with empty Original and English columns | fill the columns | not a mod defect: these keys inject into defs of the required Incense Expansion, whose English the report generator cannot read; the keys resolve (Check-DefInjected, 89 keys, 0 errors with dependencies on 2026-11-11) | 2026-11-12
- French RecipeDef/Aromas.xml `RimScentExtended_Make_Sandalwood.description` and ThingDef/Aromas.xml `RimScentExtended_Incense_Sandalwood.description`, "copeaux de bois de coeur" | "copeaux de duramen" | both terms are correct French for heartwood; "bois de coeur" is the plainer word for players and was validated by Virginie on 2026-11-11, so kept pending her call | 2026-11-12
- PUBLICATION.md reported missing | write it | not due: PUBLICATION.md is written at writeDocs, the mod is at localize | 2026-11-12
