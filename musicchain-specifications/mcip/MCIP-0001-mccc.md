# MCIP-0001: McCC

| Field | Value |
|-------|-------|
| MCIP | 0001 |
| Title | McCC rates and tier adjustment |
| Status | Draft |
| Created | 2026-06-30 |

## Abstract

Defines **MusicChain Coin Credit (McCC)** generation for listen triads and track interactions, including Iron base constants and tier multipliers.

## Motivation

McCC is the most visible reward. Public constants prevent “silent nerfs” and enable third-party calculators.

## Specification

### Listen triad (Iron, per second)

```
listener_mccc = seconds × 0.0000003521316
creator_mccc  = seconds × 0.00000000361
chain_mccc    = seconds × 0.00000000301
```

### Tier adjustment

```
tier_mccc(role) = iron_mccc(role) × tier_multiplier[badge][mccc][role]
delta_mccc(role) = tier_mccc(role) − iron_mccc(role)
```

Tier multiplier tables are maintained in `musicchain-tokenomics` when published.

### Interaction actions

Per-action Iron constants in [RewardEngine.md](../musicchain-tokenomics/RewardEngine.md).

## Rationale

Three-way split aligns listener incentive, creator revenue, and protocol sustainability.

## Backwards compatibility

Changing constants requires CHANGELOG + golden test updates. Historical blocks are never rewritten.

## Reference implementation

Private: `routes/trackblockchain/blockchain_ui_helpers.py` (constants).  
Public target: `musicchain-tokenomics/validation.py`.
