# Tokenomics & resource economy

MusicChain i3 uses **four primary account resources** plus interaction analytics dimensions (PIA / TIA / SIA / AIA).

## Resources at a glance

| Resource | Role | Typical flow |
|----------|------|----------------|
| **McCC** | MusicChain Coin Credit — primary creative/listening credit | Earned on listen, interactions; burned on chain leg |
| **Fuel** | Activity cost / creator fuel | Often negative for listener, positive for creator on listen |
| **Gas** | Network / chain gas analog | Balances listener, creator, and MusicChain treasury legs |
| **ITC** | Influence Token Credit — reputation / impact | Epochs, claims, matrix, seed-node network effects |

All rates are **tier-adjusted** from an **Iron base** (see MCIP-0001–0003). UI shows tiered vs iron vs delta (Δ).

## Listen triad (core loop)

One playtime commit produces a **listen triad** split across three roles:

```
Listener  ←→  Creator  ←→  MusicChain (chain)
   McCC         McCC          McCC (treasury / burn)
   Fuel         Fuel          Fuel
   Gas          Gas           Gas
```

**Iron base rates (per second of playtime)** — reference values from production constants:

| Role | McCC / sec | Fuel / sec | Gas / sec |
|------|------------|------------|-----------|
| Listener | +0.0000003521316 | −0.0000007 | +0.0000003 |
| Creator | +0.00000000361 | +0.0000000045313 | −0.0000000131 |
| Chain | +0.00000000301 | +0.0000000274 | +0.0000000381 |

> **Note:** Tier multipliers change effective values. Always check MCIPs and your membership badge.

### Example: 60 seconds (Iron, illustrative)

See [./musicchain-tokenomics/examples/listen_one_minute.md](./musicchain-tokenomics/examples/listen_one_minute.md).

## Interactions (not just playtime)

Fixed per-action tables exist for **like, boost, follow, download, comment** — each with listener / creator / chain legs. Documented in MCIP-0001 and `RewardEngine.md`.

## ITC

ITC is **not** minted on every listen. It accumulates through **epochs**, **claims**, **matrix / scoreboard** activity, and **network** events. See [docs/ITC.md](./docs/ITC.md) and MCIP-0004.

## MusicChain logs vs user balances

- **User balances** — wallet-like fields on the account.
- **MusicChain logs** — chain-level treasury movements (passive burns, chain legs).
- **Track blockchain** — per-track block history (TrackBlock, sub-blocks).

Reconciliation rules: MCIP-0006, MCIP-0007.

## Transparency commitment

When production constants change:

1. Update MCIP + `musicchain-tokenomics` golden tests.
2. Entry in [CHANGELOG.md](./CHANGELOG.md).
3. Never silent drift between docs and deployed code.

## Disclaimer

Parameters are **experimental**. This document describes the **intended design** of the live system. It is not financial advice.
