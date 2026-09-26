# Protocol reading record

Reviewed on 2026-09-26 from local working trees.  A `SHA-256` is the version
actually read; it remains meaningful even where the protocol repository cannot
be queried through this session's Git identity.  The local repository was at
`bfa83b83fc32e03582ab2cec8d1e222fe7f8b908` before the documentation correction
recorded below.

## Used for this checkout

| Path | SHA-256 read | Why it was used |
| --- | --- | --- |
| `../AGENTS.md` | `36631E7304333692CF07D7EB7968EC97FC1C2533F9FF342A8B80DFE160B8BCF0` | Evidence retention and CI-only publication rules. |
| `../AUDIT.md` | `D5DC23B06E35F79B2EE5E7D52AB25132AB45D517962C31A3C19D1D1445D5B740` | Stage criteria, runtime boundary, asset ownership and dispatcher-only Pickle runs. |
| `../MOD_SETTINGS.md` | `404916BC99A7F1C6FC00D7AB51D417F86FC719AB62AF023C4022F502D7A9F2C6` | Confirms the justified XML-only `settings_audit: not_applicable`. |
| `../PUBLISHING.md` | `7D34F55D583D7F657CC66B899CA7D5D385584C02D1D138AF40AFE1A7D204342A` | Public-silent marking, source link, Preview gate and release limits. |
| `../TRANSLATIONS.md` | `298F74D226DA2C4B9365D65A82275D0FE80C7EDB3FE08910F6B452FBAD945792` | French DefInjected coverage and the English-source rule. |
| `../STYLE_RIMWORLD.md` | `DE13CBE5E1F978B7357EADEDFC2DF035B857E3641B0023FD2DA6E44985FFB205` | Preview inspection and ModIcon control-only rule. |
| `../PickleTools/README.md` | `628350C7BCC3ECBFA14B6FE2A4655108065FFDC3B7E07B3A6016F879A123B67F` | Pickle companion layout and available shared tooling. |
| `../PickleTools/Headless/README.md` | `488A0BB2CA831792C3B6F284E6457DD6FC47BA6D0B2CF24B7E36EC6075DBB54B` | WSL-only execution, staging, evidence and queue rules. |
| `../Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `135D16D524E875FAD926588DF27920B00EEFB9A360E07C95361061072707FD21` | One request per language/pass and immutable tested tree until `RUN_DONE`. |
| `../Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | `90B7385B1BDA5B88C20E053F2D68C5B07FF4E07EB885C53137CBAFA73E6D8D80` | Required submission parameters, evidence path and result interpretation. |
| `STATUS.md` | `D197CD2AC6C18D93E2F4124AC9452C05C276F13E51B894E35E38C3DE174F62A3` | Existing audit evidence and the Preview/runtime blockers; no Workshop item exists yet. |
| `README.md` | `AEDF88A2F15A6795184FB2826BDFEEC71324774446653109B32D7164F5E20EE9` | Claimed features, dependencies and user-facing values. |
| `CHANGELOG.md` | `71F4EDD9F6302EABD4001C2D30A613AD0ED06224BA0AAB2EEA77B3E4900FA89C` | Unreleased initial release scope. |
| `ATTRIBUTION.md` | `F5D9209BB6B326E4E3F174B14C6161399030C6E65BECDCD61F2E35BC4DC166C4` | Rights classification, upstream credit and current public-source search result. |
| `LICENSE` | `B054D95F9B2C1B9302B895C37C3E5EACEA13EDDAC7278D307C3CAE267F227892` | MIT text and distribution claim. |
| `TESTING.md` | `921A2202A9C792E797B7EA40C9EF969C81B4BD036608CDE32F6B147E2B4E6F2A` | Offline-vs-runtime test boundary and evidence retention rule. |
| `Tests/Pickle/` | `F4C6CBF57F488282B9DFB15E2F5A6EAAF932B186A1BBFFD868BEADF70CCBA9F3` (README), `F2F60127F5EE42C98341AE5CF341045A05E8271226110A8C7697D85F6CA7A764` (map), `2BE27AE7D5DEF486D02D1CF977EEF70761309217DDA635C9D2DC81CA119705B5` (test About), `8A5572447DF7443FEC96647A23D59CBE65E6C7F2B76A1714CC7876721FFFDBE5` (feature) | Minimal runtime suite; its README was corrected to submit dispatcher tickets rather than call the launcher directly. |
| `Mod/About/About.xml` | `DD51D0E38A4F2F106B13A95544906EA72DE52942ABB42884E6E952F1A9B82981` | Delivered metadata, dependencies, public-silent disclaimer and description link. |

## Read, but not useful to the current state

These documents were consulted, but no current file or decision in this
checkout depends on them.  Do not reread merely because they change; reread at
the stated trigger.

| Path | SHA-256 read | Reread only when |
| --- | --- | --- |
| `../WORKSHOP_COMMENTS.md` | `6C69A05BB42493305B2400FE39A2CFF2FF3A9196B3FD2F2671429816B39D3C69` | preparing a public Workshop acknowledgement or comment. |
| `../scripts/SEARCHING.md` | `9DBD52B2BCD4BA66C7465C02C0E9C816B24F4251C0FD447561A315DFC15D20B4` | a corpus-wide ownership, collision or API search is needed. |
| `../PickleTools/docs/steps.md` | `0F897B4557A9B7414D95CFCCBBEA09DB3FB3CCE0DDAC463A22DAE1342678364A` | adding or changing a Gherkin step. |
| `../Rimworld-Release-Admin/docs/OPERATIONS.md` | `F6F85474F6D3DDA1521D0FBB7625EEE324F75B07CA2CC20DBF40951E93FC3AE2` | bootstrapping CI, dry-running a release, tagging, secrets or publication. |

## Absent at review time

`PUBLICATION.md`, `BACKLOG.md`, `NOTES.md`, `BUGS.md`, and `docs/runs/` did
not exist in this checkout at review time.  Their absence is recorded, not
silently treated as a completed read.  `docs/runs/` must contain one text line
per actual run when a dispatcher-owned run completes; it is intentionally not
created before there is a run.  This file is the newly created local record.

## Follow-up rule

The next session should compare the relevant SHA-256 value before relying on a
rule.  A changed document in the first table is reread when it governs the
next action; a changed document in the second table is skipped until its stated
trigger applies.
