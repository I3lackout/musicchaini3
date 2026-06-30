# ITC (Influence Token Credit)

## Definition

**ITC** measures **long-horizon influence and impact** — distinct from per-second McCC on listens.

## Sources (conceptual)

| Source | Description |
|--------|-------------|
| **Epochs / claims** | Time-windowed generation and user claims |
| **Matrix / scoreboard** | Aggregated network activity |
| **Seed-a-Node** | Community network validation rewards |
| **IX³ / chunk flows** | Advanced attribution (documented in later MCIPs) |

## Not the same as McCC

- McCC: high-frequency, playtime/interaction linked.
- ITC: lower-frequency, reputation and ecosystem weight.

## User-facing

- Profile and cash pages show `itc_balance`.
- Top chainers and scoreboard incorporate ITC in composite rankings (weights may change — see CHANGELOG).

## Normative spec

**MCIP-0004** (epochs, mint rules, claim windows)

## Security note

ITC mint/claim endpoints are **authenticated** and partially **private** until abuse models are safe to describe.

## Related

- [Economy.md](./Economy.md)
- [TOKENOMICS.md](../TOKENOMICS.md)
