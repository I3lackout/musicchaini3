# Example: 60 seconds of listening (Iron tier)

**Input:** `seconds = 60`, tier = **Iron** (multiplier 1.0)

## McCC

| Role | Calculation | Result |
|------|-------------|--------|
| Listener | 60 × 0.0000003521316 | **0.000021127896** |
| Creator | 60 × 0.00000000361 | **0.0000002166** |
| Chain | 60 × 0.00000000301 | **0.0000001806** |

## Fuel

| Role | Calculation | Result |
|------|-------------|--------|
| Listener | 60 × (−0.0000007) | **−0.000042** |
| Creator | 60 × 0.0000000045313 | **0.000000271878** |
| Chain | 60 × 0.0000000274 | **0.000001644** |

## Gas

| Role | Calculation | Result |
|------|-------------|--------|
| Listener | 60 × 0.0000003 | **0.000018** |
| Creator | 60 × (−0.0000000131) | **−0.000000786** |
| Chain | 60 × 0.0000000381 | **0.000002286** |

## Flow diagram

```
1 minute listen
       │
       ├─► Listener wallet  (+McCC, −Fuel, +Gas)
       ├─► Creator wallet   (+McCC, +Fuel, −Gas)
       └─► MusicChain log   (+McCC, +Fuel, +Gas chain leg)
```

## Notes

- Rounding in production may use `round(x, 10)` at commit time.
- Higher tiers scale each leg via multiplier — see MCIP-0001.
- This example does **not** include ITC (see MCIP-0004).

## Verify yourself

```
Listener McCC = 60 * 0.0000003521316 = 0.000021127896
```

Compare with MusicChain listenings table breakdown for a 60s session at Iron.
