# Testing

## Offline XML contract test

Run from the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File Tests/Rule-OwnValues.ps1
```

The own-values rule verifies the inventory and mood values of the six owned thoughts; checks all six incense/item/burner/recipe/hediff inventories; verifies hard dependencies, public-silent metadata, the final GitHub link, French DefInjected uniqueness and coverage count, and delivered image dimensions and size limits.

The shared 1.6 validators complement this contract against the three hard dependencies. See `STATUS.md` for the checked dependency paths and assemblies.

## Runtime scope

This mod owns XML definitions, translations and PatchOperation declarations only. It has no assembly, settings, UI, save data or custom callback. `Tests/Pickle/` contains the minimal process-level load check for the hard dependency set, written for English and French runs. Execution, capture review, effect application, research presentation, language display, persistence and logs remain runtime-unverified until owned WSL passes complete.

## Runtime evidence retention

`Tests/Pickle/Evidence/` is deliberately kept on disk and ignored by Git.  For a completed
validation, retain only the most relevant evidence bundle: `summary.json`, `junit.xml`, and a
reviewed capture only where it proves a visual claim.  Delete `report.html`, `messages.ndjson`,
duplicate captures, stale reports and superseded runs after recording the outcome in a short,
versioned `docs/runs/<date>-<sha>-summary.md` file.  The summary records the tested SHA, pass
(language and dependency map), terminal `exitReason`, discovered/played counts, verdict and the
kept evidence path; it is not a replacement for the on-disk evidence.
