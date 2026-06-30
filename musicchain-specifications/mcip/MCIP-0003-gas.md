# MCIP-0003: Gas

| Field | Value |
|-------|-------|
| MCIP | 0003 |
| Title | Gas rates |
| Status | Draft |
| Created | 2026-06-30 |

## Abstract

Defines **Gas** deltas for listen triads and interactions.

## Specification (Iron listen, per second)

```
listener_gas = seconds × 0.0000003
creator_gas  = seconds × (−0.0000000131)
chain_gas    = seconds × 0.0000000381
```

## Reference implementation

See MCIP-0001 reference paths.
