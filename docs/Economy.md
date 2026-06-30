# Economy overview

MusicChain i3’s economy is **role-based** and **event-driven**.

## Three roles on every listen

| Role | Who |
|------|-----|
| **Listener** | Account playing the track |
| **Creator** | Track uploader / rights holder on platform |
| **MusicChain** | Protocol treasury / chain leg (burns & passive flows) |

## Event pipeline (simplified)

```
Playtime commit
    → listen_triad (event_id)
    → user balance updates (McCC, Fuel, Gas)
    → track blockchain transaction
    → MusicChain log row (chain leg)
    → notifications / TFPS / soul reducer (derived)
```

## Resource coupling

- **McCC** — primary “credit” display; creator/listener earnings.
- **Fuel** — often negative for listeners (cost of attention); funds creator activity.
- **Gas** — balances network/treasury; can be negative for creator on listen.
- **ITC** — decoupled longer-horizon influence (epochs, matrix, claims).

## Tier system

All public tables start from **Iron** base rates. Membership badge applies multipliers:

```
effective = iron_base × tier_multiplier[token][role]
Δ = effective − iron_base   (shown in UI breakdown)
```

## Interaction types

Beyond listen:

| Type | Analytics bucket |
|------|------------------|
| Profile actions | PIA |
| Track actions | TIA |
| Session / live | SIA |
| Advertising | AIA |

Each has per-action McCC/Fuel/Gas tables (see tokenomics repo).

## Where to read next

- [McCC.md](./McCC.md) · [Fuel.md](./Fuel.md) · [Gas.md](./Gas.md) · [ITC.md](./ITC.md)
- [Chain.md](./Chain.md) · [Validation.md](./Validation.md)
- [TOKENOMICS.md](../TOKENOMICS.md)
