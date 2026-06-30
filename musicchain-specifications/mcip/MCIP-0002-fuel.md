# MCIP-0002: Fuel

| Field | Value |
|-------|-------|
| MCIP | 0002 |
| Title | Fuel rates |
| Status | Draft |
| Created | 2026-06-30 |

## Abstract

Defines **Fuel** deltas for listen triads and interactions.

## Specification (Iron listen, per second)

```
listener_fuel = seconds × (−0.0000007)
creator_fuel  = seconds × 0.0000000045313
chain_fuel    = seconds × 0.0000000274
```

Interaction tables: see [RewardEngine.md](../musicchain-tokenomics/RewardEngine.md).

## Reference implementation

Private constants mirror MCIP-0001 file layout.
