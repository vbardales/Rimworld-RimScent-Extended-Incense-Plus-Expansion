---
mod: RimScent Extended: Incense Plus Expansion
packageId: nelim.rimscent.extended.incenseplus
repo: Rimworld-RimScent-Extended-Incense-Plus-Expansion
remote: https://github.com/vbardales/Rimworld-RimScent-Extended-Incense-Plus-Expansion.git
visibility: public
detached: yes
workflow_stage: setupRepo      # the work to do (AUDIT.md chain)
licence: silent
licence_at: "2026-09-22: the targeted mod declares nothing; nothing was taken from it (Rimcense: Neolithic Soothe is a 1.4 unlicensed inspiration)"
upstream_mod_remotes: N/A
settings_audit: not_applicable
localization: complete
translation_en: complete
translation_fr: unchecked
dependencies: declared
workshop: 3811308373 (private item from the 0.1.0 prepublication; Steam creates every item private)
published: no
tested_on: never
remaining:
  - "2026-11-11: unverified: upstream_mod_remotes set to N/A without a search for the RimScent repositories"
  - "2026-11-11: unverified: Preview.png regenerated and committed in 023db5f; its values against the delivered defs not rechecked (earlier defect: values disagreed with the defs)"
  - "2026-11-11: unverified: the minimal Pickle pass is written but not executed in English or French"
  - "2026-11-11: unverified: game load, dependency integration, research, construction, aroma effects, expiry, persistence, and French/English display never run"
updated: 2026-11-11
protocols_read_sha: 45357975862be47b344cc129a47910946cba3ac9
---

# RimScent Extended: Incense Plus Expansion — status

## Audit — 2026-09-22

This checkout is now an autonomous Git repository on `main` (`detached: yes`), created from the
audited state without a subtree. Its `origin` is
`https://github.com/vbardales/Rimworld-RimScent-Extended-Incense-Plus-Expansion.git`; the two
initial commits were rebased on the existing remote history and pushed without force on
2026-09-22. The initial repository/documentation gate is complete. The installed 128x128 ModIcon
directly passes its file and visual inspection, so the justified stage is `ModIcon générée`; the
defective Preview blocks the next transition.

Static checks were run against RimWorld 1.6, RimScent, Incense Expansion, and the local
RimScent Extended dependency:

- all 17 shipped XML files parsed;
- `Check-XmlFields.ps1` found no unknown 1.6 XML fields when both dependency assemblies were
  supplied;
- `Check-DefRefs.ps1` found no missing or wrongly typed Def references and all parents resolved;
- `Check-ConfigErrors.ps1` checked 38/38 defs with 26 rules and found no config error;
- `Check-DefInjected.ps1` checked 89 French DefInjected keys with 0 errors, including the
  declared dependencies. English is supplied by the shipped Def values.
- `Tests/Test-Xml.ps1` passed: 17 XML files, six aromas, and 89 French DefInjected entries.

`settings_audit: not_applicable` is justified statically: this is XML-only (no source project or
assembly), contains no settings or MainButtons definition, and has no route that could create a
settings page. The absence is not an in-game interaction claim.

The distributed MIT copies are byte-identical. `ModIcon.png` is 128x128 (21,183 bytes) and
`Preview.png` is 896x504 (548,926 bytes), thus below the 1 MiB limit. Direct visual inspection
found the Preview defective: its listed effects do not match the delivered HediffDefs (for example
immunity +50% versus +10%, toxic buildup -30% versus toxic resistance +15%, and mental break
threshold -20% versus -0.06).

The status remains `silent` because Rimcense: Neolithic Soothe is a 1.4 unlicensed inspiration,
even though no file, asset, Def, or value from it is redistributed. For a public silent mod, the
required `(unofficial)` suffix and opening disclaimer are present in About.xml and README. The
English About description ends with the required GitHub source-code link. `CHANGELOG.md` records
the initial 0.1.0 release.

No RimWorld process or Pickle run was launched. Consequently, loading, integration behavior,
effects, persistence, and both language displays remain unverified. There is no production source
project; the later gates remain blocked by the defective Preview and missing runtime evidence.

The offline XML contract, `TEST_SCENARIOS.md`, and a development-only minimal Pickle companion
now exist. The contract test passed locally; the Pickle feature is deliberately not counted as
executed until an owned WSL run produces a terminal report in both English and French.

## Protocol follow-up — 2026-09-26

No Workshop item has been prepublished and no `Mod/About/PublishedFileId.txt` is expected in this
checkout. The independently established Preview defect and the unexecuted runtime checks keep the
stage at `ModIcon générée`.

No tracked or on-disk `.dds` asset and no `Tests/Pickle/Evidence/` directory were found.  `.dds`
intermediates and runtime evidence are now ignored; `TESTING.md` defines the small on-disk evidence
bundle and the versioned run summary to retain after a real dispatcher-owned pass.
