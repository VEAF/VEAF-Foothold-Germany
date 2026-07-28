# VEAF Foothold — Germany (Cold War)

VEAF adaptation of the **Foothold** campaign by *Lekaa* ([upstream repository](https://github.com/leka1986/Lekas-Foothold)),
built with the [VEAF Mission Creation Tools](https://github.com/VEAF/VEAF-Mission-Creation-Tools) v6 toolchain.

## What is in this repository

| Path | What it is |
|------|------------|
| `mission.yaml` | the VEAF configuration of this mission — modules, `config_override`, security, presets |
| `src/mission/` | the upstream `.miz` unpacked (Lekaa's mission itself) |
| `src/scripts/` | the Lua scripts the mission loads, Foothold's own included |
| `src/presets.yaml` | the shared VEAF radio presets |

Not versioned: the toolchain (`veaf-tools*.exe`, `published/`), the built `.miz`, the build
reports, and the Lua files `veaf-tools` generates from `mission.yaml`. See `.gitignore`.

## Building the mission

From this folder, with the toolchain deployed by `veaf-tools-updater.exe`:

```
veaf-tools.exe build
```

The output is `VEAF_Foothold_GermanyColdWar_ICAO_EDFH_<date>.miz`.

> **The file name matters.** `_ICAO_EDFH` is read by the RealWeather extension of DCSServerBot,
> which fetches Frankfurt-Hahn's live METAR at mission start. Renaming the mission without that
> marker silently disables real weather.

## Updating to a new Lekaa release

Download this map's archive from [Lekaa's releases](https://github.com/leka1986/Lekas-Foothold/releases),
then, from a clone of the tools repository:

```
.\tools\Convert-FootholdBatch.ps1 -InputFolder <download folder> -OutputFolder <missions folder> -Update -Build
```

`--update` refreshes the third-party scripts and the mission base while **preserving**
`mission.yaml`. Review the report, then rebuild. The full procedure is in
[FOOTHOLD.md](https://github.com/VEAF/VEAF-Mission-Creation-Tools/blob/develop/doc/mission-maker/FOOTHOLD.md).

## History

The `last-v5-version` tag marks the last state of this mission before the v6 migration — the era
when scripts were loaded from the server through a hand-written `VEAF_common.lua`.
