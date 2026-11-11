---
mod: RimScent Extended: Incense Plus Expansion
packageId: nelim.rimscent.extended.incenseplus
repo: Rimworld-RimScent-Extended-Incense-Plus-Expansion
remote: https://github.com/vbardales/Rimworld-RimScent-Extended-Incense-Plus-Expansion.git
visibility: public
detached: yes
workflow_stage: writeTests[1.0.0]
licence: silent
licence_at: "2026-09-22: the targeted mod declares nothing; nothing was taken from it (Rimcense: Neolithic Soothe is a 1.4 unlicensed inspiration)"
upstream_mod_remotes: N/A
settings_audit: not_applicable
localization: complete
translation_en: complete
translation_fr: complete
dependencies: declared
workshop_required_items: n/a, not released yet
workshop: 3811308373 (private item from the 0.1.0 prepublication; Steam creates every item private)
published: no
tested_on: never
remaining:
  - "2026-11-11: defect: Preview-source.png background still shows Mental break threshold -20% while the def says -0.06; echo and 1.6 ribbon rendered as is"
  - "2026-11-11: unverified: upstream_mod_remotes set to N/A without a search for the RimScent repositories"
  - "2026-11-11: unverified: Preview.png regenerated and committed in 023db5f; its values against the delivered defs not rechecked (earlier defect: values disagreed with the defs)"
  - "2026-11-11: unverified: the minimal Pickle pass is written but not executed in English or French"
  - "2026-11-11: unverified: game load, dependency integration, research, construction, aroma effects, expiry, persistence, and French/English display never run"
updated: 2026-11-11
protocols_read_sha: db692bebc9ba2f8212ad6d1086a6b6f7f3d80cb1
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

## Dependencies: 2026-11-11, revision a00e8e4

Hard dependencies (`modDependencies`, all three used by the XML): `reo.RimScent` (Workshop 3645569466),
`ocarina.rimscent.incense` (3678830567, the burner and recipe parents patched and inherited),
`nelim.rimscent.extended` (GitHub download URL, carries `ModExtension_ScentHediff`). The three packageIds
were read in their installed `About.xml`. `loadAfter` lists the same three plus Harmony and Ludeon.RimWorld;
the mod is a leaf, so there is no cycle.

Optional integrations: none. `Check-OptionalCompat.ps1`: 0 patched target(s), 0 declared; no
`MayRequire`, `IfModActive` or `PatchOperationFindMod` in `Mod/`. No `LoadFolders.xml` (single root,
`supportedVersions` 1.6). DLC: none referenced. Animal integrations (4.f): not applicable, no animal added.
Required items on the Steam page: `n/a, not released yet` (owner decision 2026-11-10, AUDIT.md 4.g).

## Settings audit: 2026-11-11, revision 837794f

`settings_audit: not_applicable`. Inventory: the mod is XML only (no `Source/`, no `Assemblies/`), declares
no `ModSettings`, no `MainButtonDef` and no settings page; the six aromas, burners, recipes, thoughts and
research have fixed values in the Defs. Decision: no setting is useful, an option would only duplicate a Def
value. Verified in the sources by `grep` for `MainButtonDef|ModSettings|SettingsCategory` over `Mod/`: no hit,
so there is no empty page and no shortcut. Access route, usage review and settings tests: not applicable.
Nothing here is an in-game claim; the in-game check that no settings entry appears stays for `playTests`.

## Translation audit: 2026-11-11, revision 05f1171

English is the Def values shipped in `Mod/Defs/`. French lives in `Mod/Languages/French/DefInjected/` (9 files,
89 keys, covering this mod and the Incense Expansion it requires). `Check-Translations.ps1`: PASS, 71 source texts.
`Check-DefInjected.ps1` with the three dependencies as targets: 89 keys, 0 errors. Every French string was read in
full: no `tu`, `vous` or `nous` addressed to the player, no pawn agreement needed, so no gender choice (6.e not
applicable). Doubtful texts: none flagged; `smokeleaf` and `psychoïde` stay untranslated on purpose (names of
base-game items). `TRANSLATION_REVIEW.md` regenerated. Not done: Virginie's review of the French (6.g), then
`translation_fr` may become `complete`.

Virginie's review of the French: 2026-11-11, revision df49414, validated without corrections after four ChatGPT
passes (seven wording fixes applied: aromatic incense research text and label, three recipe pronouns, two toxin
wordings). `translation_fr` is `complete`.
