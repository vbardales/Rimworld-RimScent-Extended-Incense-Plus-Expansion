# RimScent Extended: Incense Plus Expansion

Six incenses whose effects reach past the nose, for RimWorld 1.6.

[RimScent](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)'s
[Incense Expansion](https://steamcommunity.com/sharedfiles/filedetails/?id=3678830567)
ships two sticks: one that lifts the mood a little, one that lowers it. This adds six more,
each with a real effect on the body — in the spirit of *Rimcense: Neolithic Soothe*, which
never left 1.4.

## The six aromas

| Incense | Mood | Effect | Ingredients (per 16) |
| --- | --- | --- | --- |
| Sandalwood | +4 | mental break threshold −0.06, social fight chance ×0.5 | 8 wood + 1 herbal medicine |
| Frankincense | +2 | immunity gain +0.10, toxic resistance +0.15 | 6 wood + 2 herbal medicine |
| Psychoid | +2 | pain ×0.75, rest fall ×0.90 | 6 wood + 8 psychoid leaves |
| Smokeleaf | +5 | work speed −0.05, rest fall ×0.85 | 6 wood + 8 smokeleaf leaves |
| Berry | +2 | work speed +0.06 | 6 wood + 10 berries |
| Cocoa | +3 | social impact and negotiation +0.15 | 6 wood + 3 chocolate |

Sandalwood is the barracks incense; frankincense the hospital one; cocoa is what you burn
before a trade caravan arrives. Smokeleaf has the best mood in the set and the worst work
speed, and an ascetic (`DrugDesire -1`) gets no mood out of it at all — the same treatment
the base game gives its own smokeleaf thoughts.

The mood and the effect are two separate things. Standing in the room gives the colonist a
`ThoughtDef`, which RimScent applies on its own, **and** a `HediffDef` on top of it, which
RimScent cannot do — hence the dependency on the socle, which provides
`ModExtension_ScentHediff`. The hediff carries a `HediffCompProperties_Disappears` timer of
1500 ticks that the scan pushes back on every pass, so an aroma follows the pawn out of the
room and fades about 25 seconds later. RimScent's scan interval runs from 60 to 1000 ticks,
so the timer covers the worst case without ever expiring under a colonist still standing in
the smoke.

## The six burners

One button in the Architect menu, six variants in its dropdown, each glowing in its own
colour. They inherit from the Incense Expansion's own `RimScent_IncenseBurnerBase`, so they
behave exactly like it: switchable, refuellable, a little light and a little heat. No
texture is redistributed — the burners and the sticks reuse the Incense Expansion's own
textures, which is a hard dependency, and the six aromas are told apart by a `<color>` on
the stack graphic.

## Balance, as a side effect

The Incense Expansion sets no research requirement at all, while the Perfume Expansion gates
its content behind `PerfumeTech`. A permanent mood burner was therefore available on day one
for four wood and four berries. Two neolithic research projects fix that:

- **incense crafting** (500) — gates the original two recipes and the burner.
- **aromatic incense** (1000, requires the above) — gates the six aromas here.

Both are neolithic and the first has no prerequisite, so a tribal start is not locked out of
its own technology: the burner is neolithic and the crafting spot still works.

The patch also drops `FueledSmithy` and `ElectricSmithy` from the original recipes — a forge
works metal and has no business rolling fragrant sticks — and adds `DrugLab`, where the
perfumes of the sister expansion are already made. `CraftingSpot` stays.

All three changes are `PatchOperation`s against the abstract parent defs, so nothing is
overwritten and the Incense Expansion is left untouched on disk.

## Language

Labels are English, French is injected on top through `Languages/French/DefInjected`, so the
mod works in any language. The French folder also covers the **Incense Expansion itself**,
which ships no `Languages` folder at all.

## Requirements

- [RimScent](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)
- [RimScent: Incense Expansion](https://steamcommunity.com/sharedfiles/filedetails/?id=3678830567)
- RimScent Extended (the socle)

No save data is added: it can be added to or removed from an ongoing game.

## Licence

MIT — see [LICENSE](LICENSE) and [ATTRIBUTION.md](ATTRIBUTION.md).
