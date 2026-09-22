# Pickle test suite

Development-only companion for RimScent Extended: Incense Plus Expansion. It is never included in `Mod/` or uploaded to the Workshop.

`01-minimal-load.feature` checks that the two research defs, six burner defs and six aroma HediffDefs load in a real RimWorld process without errors. It is the runtime counterpart to the offline XML contract test; it does not claim to test scanner behavior, visual presentation, hediff application, saves, or language switching.

Run each language only through the shared WSL launcher:

```powershell
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod RimScentExtendedIncensePlusExpansion -DepMap wsl-deps.sans-facultatifs.map -Language English
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod RimScentExtendedIncensePlusExpansion -DepMap wsl-deps.sans-facultatifs.map -Language French
```

There is no optional integration pass: every dependency used by the shipped XML is hard. Results, logs and reviewed captures remain unverified until an owned WSL run has completed.
