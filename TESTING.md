# Testing

## Offline XML contract test

Run from the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File Tests/Test-Xml.ps1
```

The test parses every shipped XML file; verifies the inventory and mood values of the six owned thoughts; checks all six incense/item/burner/recipe/hediff inventories; verifies hard dependencies, public-silent metadata, the final GitHub link, French DefInjected uniqueness and coverage count, and delivered image dimensions and size limits.

The shared 1.6 validators complement this contract against the three hard dependencies. See `STATUS.md` for the checked dependency paths and assemblies.

## Runtime scope

This mod owns XML definitions, translations and PatchOperation declarations only. It has no assembly, settings, UI, save data or custom callback. `Tests/Pickle/` contains the minimal process-level load check for the hard dependency set, written for English and French runs. Execution, capture review, effect application, research presentation, language display, persistence and logs remain runtime-unverified until owned WSL passes complete.
