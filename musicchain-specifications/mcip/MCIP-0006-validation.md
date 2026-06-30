# MCIP-0006: Chain validation

| Field | Value |
|-------|-------|
| MCIP | 0006 |
| Title | Validation rules |
| Status | Draft |
| Created | 2026-06-30 |

## Abstract

Rules for verifying track chains and reward commits.

## Specification

1. **Hash linkage** — `previous_hash` must match prior block hash.
2. **Payload schema** — required fields per `tx_type`.
3. **Reward tie-out** — resource deltas match MCIP-0001/2/3 for declared duration/action.
4. **No retroactive edits** — append-only event store.

## Tolerance

Floating comparisons use epsilon `1e-10` unless otherwise specified in golden tests.

## Reference implementation

Target: `musicchain-tokenomics/validation.py`.
