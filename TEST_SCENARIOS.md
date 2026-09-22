# Functional test scenarios

These scenarios define remaining `done → tested` evidence. They are not results and must not be treated as passed until executed in a controlled WSL RimWorld run.

## Minimal load in English and French

Run `Tests/Pickle/wsl-deps.sans-facultatifs.map` in each startup language. Confirm a terminal successful `exitReason`, all expected assertions, and no startup or scenario errors.

## Research and construction

In a fresh colony, research Incense Crafting and Aromatic Incense. Confirm the original burner and recipes use the first project, all six aromatic burners appear after the second, and every incense is craftable at both the Crafting Spot and Drug Lab.

## Aroma effects and expiry

Refuel and switch on each burner. Confirm the colonist receives the matching thought and Hediff with the documented effect, then leaves the room and loses the Hediff after its grace period. Confirm the Smokeleaf thought is nullified for an ascetic.

## Persistence and presentation

Save with an active burner, reload, and confirm state and behavior. Review Architect, research, items, thoughts and Hediffs in English and French for resolved text, meaning and clipping. Every capture requires direct human review before it becomes evidence.
