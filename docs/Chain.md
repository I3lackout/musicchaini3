# Chain (Track blockchain & logs)

## Track blockchain

Each track maintains a chain of **blocks** documenting interactions and commits.

| Concept | Purpose |
|---------|---------|
| **TrackBlock** | Primary block record on a track chain |
| **TrackSubBlock** | Finer sub-chain (e.g. community reward pipeline) |
| **previous_hash** | Links block to predecessor |
| **tx_type** | e.g. `listen_triad`, interaction types |

## MusicChain logs

System-level ledger rows for **MusicChain (chain role)** resource movements — used in:

- MusicChain page treasury displays
- Scoreboard ITC / passive burn reconciliation
- In-depth scoreboard “network impact”

## Triad commit

Listen events write:

1. User balance deltas (listener + creator)
2. Track blockchain transaction
3. MusicChain log entry for chain leg

Single `event_id` prevents drift (see triad soul architecture).

## Explorer

Public UI: track blockchain views, MusicChain logs, proof explorer (site features).

## Normative specs

- **MCIP-0005** — TrackBlock structure
- **MCIP-0006** — Validation rules
- **MCIP-0007** — MusicChainLog schema

## Related

- [Validation.md](./Validation.md)
- [Economy.md](./Economy.md)
