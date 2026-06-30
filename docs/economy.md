# Economy

MusicChain i3’s economy is **role-based** and **event-driven**. Every meaningful action attributes resources to defined roles with documented rates.

## Three roles on every listen

| Role | Who |
|------|-----|
| **Listener** | Account playing the track |
| **Creator** | Track uploader / rights holder on platform |
| **MusicChain** | Protocol treasury / chain leg (burns & passive flows) |

## Event pipeline

```
Playtime commit
    → listen_triad (shared event_id)
    → user balance updates (McCC, Fuel, Gas)
    → track blockchain transaction
    → MusicChain log row (chain leg)
    → notifications / TFPS / soul reducer (derived)
```

## Resources

| Resource | Role in the system |
|----------|-------------------|
| **McCC** | Primary credit display; listener/creator earnings |
| **Fuel** | Attention cost for listeners; funds creator activity |
| **Gas** | Network/treasury balance; creator leg on listens |
| **ITC** | Long-horizon influence — epochs, matrix, claims |

Detail: [McCC.md](./McCC.md) · [Fuel.md](./Fuel.md) · [Gas.md](./Gas.md) · [ITC.md](./ITC.md)

## Tier system

Public tables start from **Iron** base rates. Membership badge applies multipliers:

```
effective = iron_base × tier_multiplier[token][role]
Δ = effective − iron_base   (shown in UI breakdown)
```

Normative tables: MCIPs in [musicchain-specifications/](./musicchain-specifications/).

## Interaction types

Beyond listening, the platform records profile and track interactions:

- **PIA** — Profile Interaction Analytics → [PIA.md](./PIA.md)  
- **TIA** — Track Interaction Analytics → [TIA.md](./TIA.md)  

## Tokenomics reference

- Overview: [TOKENOMICS.md](../TOKENOMICS.md)  
- Walkthrough: [musicchain-tokenomics/examples/listen_one_minute.md](./musicchain-tokenomics/examples/listen_one_minute.md)  
- Engine notes: [musicchain-tokenomics/RewardEngine.md](./musicchain-tokenomics/RewardEngine.md)  

## Proposing changes

Economy rule changes require an **MCIP** — see [CONTRIBUTING.md](../CONTRIBUTING.md).
