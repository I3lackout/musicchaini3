# Fuel

## Definition

**Fuel** models activity cost and creator support. On listens, listeners often **spend** Fuel (negative delta) while creators and the chain may **gain** Fuel.

## Listen (Iron base, per second)

| Role | Fuel / sec |
|------|------------|
| Listener | −0.0000007 |
| Creator | +0.0000000045313 |
| MusicChain | +0.0000000274 |

## Interactions (Iron base — selected)

| Action | Listener | Creator | Chain |
|--------|----------|---------|-------|
| Like | −0.00850 | +0.00620 | +0.0012 |
| Boost | −0.00350 | +0.00120 | +0.0012 |
| Comment | −0.00100 | +0.00370 | +0.0012 |
| Download | −0.00350 | +0.00120 | +0.0166 |

## Design intent

- Discourage spam interactions (listener cost).
- Reward creators for engagement quality.
- Feed chain treasury for protocol stability.

## Normative spec

**MCIP-0002**

## Related

- [McCC.md](./McCC.md) · [Gas.md](./Gas.md)
