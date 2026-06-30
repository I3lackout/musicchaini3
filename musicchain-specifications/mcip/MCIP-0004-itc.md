# MCIP-0004: ITC

| Field | Value |
|-------|-------|
| MCIP | 0004 |
| Title | ITC — Influence Token Credit |
| Status | Draft |
| Created | 2026-06-30 |

## Abstract

ITC represents **influence** accrued over epochs, claims, matrix activity, and network validation — not per-second listen minting.

## Motivation

Separate ITC from McCC to avoid double-counting short-term listens as long-term reputation.

## Specification (high level)

- `itc_balance` stored per user (float/decimal in DB).
- Mint paths: epoch finalization, claims, seed-node network rewards, admin genesis (documented).
- Claim windows and rates: *to be expanded in Accepted revision*.

## Security

Mint/claim endpoints require authentication. Public spec does not include anti-fraud thresholds.

## Reference implementation

Private: `routes/cash/`, `hybrid_bridge.py`, scoreboard aggregation.
