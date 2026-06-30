# Blockchain

MusicChain i3 uses a **track-scoped blockchain model** — not a public L1 chain. Each track maintains an auditable chain of blocks documenting interactions and economic commits.

## Concepts

| Concept | Purpose |
|---------|---------|
| **TrackBlock** | Primary block on a track’s chain |
| **TrackSubBlock** | Finer sub-chain (e.g. community reward pipeline) |
| **previous_hash** | Links block to predecessor |
| **tx_type** | e.g. `listen_triad`, interaction types |

## MusicChain logs

System-level ledger rows for **MusicChain (chain role)** resource movements:

- Treasury displays on the MusicChain page  
- Scoreboard ITC / passive burn reconciliation  
- In-depth scoreboard “network impact”

## Triad commit

A single listen event writes atomically:

1. User balance deltas (listener + creator)  
2. Track blockchain transaction  
3. MusicChain log entry for the chain leg  

A shared **`event_id`** prevents drift between legs (triad soul architecture).

## Validation

Blocks and commits must satisfy rules in **MCIP-0006** — hash linkage, allowed `tx_type` values, balance consistency. See [Validation.md](./Validation.md).

## Explorer

The live site exposes track blockchain views, MusicChain logs, and proof-oriented UI. Open-source validators are planned in Phase 2–3.

## Normative specs

| MCIP | Topic |
|------|--------|
| [MCIP-0005](./musicchain-specifications/mcip/MCIP-0005-trackblock.md) | TrackBlock structure |
| [MCIP-0006](./musicchain-specifications/mcip/MCIP-0006-validation.md) | Validation rules |
| [MCIP-0007](./musicchain-specifications/mcip/MCIP-0007-musicchainlog.md) | MusicChainLog schema |

## Related

- [economy.md](./economy.md)  
- [architecture.md](./architecture.md)  
- [Chain.md](./Chain.md) — extended reference (legacy path)
