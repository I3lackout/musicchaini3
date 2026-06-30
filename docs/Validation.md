# Validation

## Goals

1. **Integrity** — block hashes form a consistent chain.
2. **Accounting** — sum of role legs matches committed playtime/interaction rules.
3. **Projection** — UI reads derived state, not ad-hoc SQL that bypasses reducers.

## Block validation

- `previous_hash` matches prior block.
- Block payload fields match declared `tx_type`.
- Timestamps monotonic per track (where enforced).

## Reward validation

For a listen of `seconds` at tier `T`:

```
for role in (listener, creator, chain):
  assert delta[token][role] ≈ iron_rate[token][role] × seconds × tier_mult[T][token][role]
```

Tolerance: floating-point epsilon documented in tokenomics tests.

## Log reconciliation

MusicChain log totals should align with:

- Sum of chain-leg commits in window
- Scoreboard passive burn displays (when `source=logs`)

Discrepancies are bugs — report via SECURITY.md.

## Event → state pipeline

Normative order (State v1):

```
ListenTriadEvent (append-only)
  → reduce_track_soul()
  → TrackSoulState JSON
  → projections (analytics frame, charts)
  → UI
```

**Rule:** UI must not re-implement economy formulas hidden from docs.

## Normative spec

**MCIP-0006** — Chain validation  
**MCIP-0007** — MusicChainLog

## Future public code

`musicchain-tokenomics/validation.py` — golden vectors for auditors.

## Related

- [Chain.md](./Chain.md)
- [../musicchain-tokenomics/](../musicchain-tokenomics/)
