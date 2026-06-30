# TIA (Track Interaction Analytics)

## Definition

**TIA** covers **track-level** interactions: likes, boosts, comments, downloads, follows, listenings.

## Data model (conceptual)

- `TInteraction` / listening sessions tied to `track_id`.
- Track blockchain records interaction blocks.
- Analytics frame (`track_analytics_frame_v1`) derives charts — not raw SQL in UI.

## Economy

Per-action Iron tables for McCC, Fuel, Gas — see [../musicchain-tokenomics/RewardEngine.md](../musicchain-tokenomics/RewardEngine.md).

## Listenings vs playtime

- **Listening** — session count / engagement metric.
- **Playtime** — seconds committed via playtime pipeline (listen triad).

## UI surfaces

- Track page, track blockchain explorer
- MusicChain listenings tables (`/musicchain`)
- Library search results

## Normative spec

Rates bundled in **MCIP-0001** (McCC leg); Fuel/Gas in MCIP-0002/0003.

## Related

- [PIA.md](./PIA.md)
- [Chain.md](./Chain.md)
