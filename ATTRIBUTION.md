# Attribution

## RimScent, and its Incense Expansion

by **reo / ocarina0001** — MIT.

- [RimScent](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)
- [RimScent: Incense Expansion](https://steamcommunity.com/sharedfiles/filedetails/?id=3678830567)

This mod is a companion, not a fork. No file from either mod is copied or redistributed.
It declares them as hard dependencies and:

- inherits from `RimScent_IncenseBurnerBase` and `RimScent_Recipe_IncenseBase`, which means
  the burner and stick **textures shipped by the Incense Expansion are loaded from that mod
  at runtime**, never duplicated here;
- uses `RimScentReworked.ModExtension_Scent`, RimScent's own public extension point;
- modifies the Incense Expansion's recipes and burner only through `PatchOperation`s.

The French translation of the Incense Expansion's four defs is original work.

## Rimcense: Neolithic Soothe

by **velcroboy333** and **Hydromancerx** —
[Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=2532255863), 1.4.

The idea of incenses with distinct mechanical effects comes from this mod, which is where
this expansion started. **No file, def, texture or value from Rimcense is reused.** It
declares no licence, so nothing of it could be taken even if we wanted to: not its defs, not
its plants (sandalwood, frankincense, tragacanth), not its textures.

Every ingredient here is vanilla. Sandalwood and frankincense are preparations of wood and
herbal medicine, not new species — which is also why they are craftable on day one rather
than requiring a crop this mod does not add.

## This mod

MIT, © Nelim. Defs, patches, research, balance values and translations are original work.
