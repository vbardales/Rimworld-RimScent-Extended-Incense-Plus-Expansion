---
settings_audit: not_applicable
localization: complete
translation_en: complete
translation_fr: complete
mod:          RimScent Extended: Incense Plus Expansion
packageId:    nelim.rimscent.extended.incenseplus
repo:         Rimworld-RimScent-Extended-Incense-Plus-Expansion
visibility:   public
detached:     yes
stage:        ModIcon générée
licence:      silent
licence_at:   the targeted mod declares nothing: nothing was taken from it
dependencies: declared
showcase:     defective
tested_on:
workshop:
remaining:
  - defect: Preview.png advertises gameplay values that disagree with the delivered defs.
  - unverified: functional scenarios and automated-test results required for the later preTest/done gates have not been written.
  - unverified: game load, dependency integration, effects, French/English display, and save behavior have never been run.
session:      audit:      2026-09-22, static evidence only
updated:      2026-09-22, evidence-based audit
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
effects, persistence, and both language displays remain unverified. No source/test project,
`TEST_SCENARIOS.md`, or `Tests/` is present, so the later preTest/done gates are not met.
