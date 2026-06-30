# PIA (Profile Interaction Analytics)

## Definition

**PIA** covers interactions aimed at **user profiles** — follows, profile-level actions, and related analytics buckets.

## Data model (conceptual)

- `PInteraction` records link **actor** → **target user**.
- Aggregated in profile analytics, stalk hub, and search indices.

## Economy

Profile interactions use the same **three-role** McCC / Fuel / Gas splits as track interactions where applicable. Rates are action-specific (see RewardEngine).

## UI surfaces

- Profile pages (`/user/...`)
- Stream profile interaction tables
- Search / KI index (`source: profile`)

## Normative spec

Future **MCIP** (profile interaction rate tables) — until then, cross-reference TIA tables for analogous action types.

## Related

- [TIA.md](./TIA.md)
- [Economy.md](./Economy.md)
