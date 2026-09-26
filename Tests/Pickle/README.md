# Pickle test suite

Development-only companion for RimScent Extended: Incense Plus Expansion. It is never included in `Mod/` or uploaded to the Workshop.

`01-minimal-load.feature` checks that the two research defs, six burner defs and six aroma HediffDefs load in a real RimWorld process without errors. It is the runtime counterpart to the offline XML contract test; it does not claim to test scanner behavior, visual presentation, hediff application, saves, or language switching.

Run each language by filing a request with the shared dispatcher; do not invoke
`Run-PickleWsl.ps1` from a session. Substitute the submitting session's
`local_...` identifier and keep the working tree at the SHA named in the label
until both requests have reached `RUN_DONE`:

```powershell
powershell.exe -ExecutionPolicy Bypass -File C:\Users\nelim\Documents\rimworld\Rimworld-Ticket-Dispatcher\scripts\Submit-PickleRun.ps1 `
  -Mod RimScentExtendedIncensePlusExpansion -Owner local_<session-id> `
  -Label "minimal load English, <tested-sha>" -Language English `
  -EvidenceDir RimScentExtendedIncensePlusExpansion/Tests/Pickle/Evidence/minimal-load-en
powershell.exe -ExecutionPolicy Bypass -File C:\Users\nelim\Documents\rimworld\Rimworld-Ticket-Dispatcher\scripts\Submit-PickleRun.ps1 `
  -Mod RimScentExtendedIncensePlusExpansion -Owner local_<session-id> `
  -Label "minimal load French, <tested-sha>" -Language French `
  -EvidenceDir RimScentExtendedIncensePlusExpansion/Tests/Pickle/Evidence/minimal-load-fr
```

There is no optional integration pass: every dependency used by the shipped XML is hard. Results, logs and reviewed captures remain unverified until an owned WSL run has completed.
