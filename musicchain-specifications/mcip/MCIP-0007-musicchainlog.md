# MCIP-0007: MusicChainLog

| Field | Value |
|-------|-------|
| MCIP | 0007 |
| Title | MusicChainLog schema |
| Status | Draft |
| Created | 2026-06-30 |

## Abstract

System-level log rows for **chain role** resource movements (McCC, Fuel, Gas, ITC deltas).

## Motivation

Scoreboard and MusicChain treasury UI read logs for passive burns and network ITC. Users need clarity on `source=logs` vs modeled fallbacks.

## Specification (fields, conceptual)

```
MusicChainLog:
  timestamp, tx_type, mccc_delta, fuel_delta, gas_delta, itc_delta,
  reference_id, metadata_json
```

## Reconciliation

Sum of `itc_delta` over window should match scoreboard network ITC when pipeline is healthy.

## Reference implementation

Private: `MusicChainLog` model, `community_reward_pipeline.py`, scoreboard aggregation.
