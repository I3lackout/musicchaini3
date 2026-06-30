# Reward engine — Iron base constants

Source alignment: production `blockchain_ui_helpers` constants (2026-06).  
Normative: MCIP-0001, MCIP-0002, MCIP-0003.

## Listen (per second)

| Token | Listener | Creator | Chain |
|-------|----------|---------|-------|
| McCC | 0.0000003521316 | 0.00000000361 | 0.00000000301 |
| Fuel | −0.0000007 | 0.0000000045313 | 0.0000000274 |
| Gas | 0.0000003 | −0.0000000131 | 0.0000000381 |

## Like (per action)

| Token | Listener | Creator | Chain |
|-------|----------|---------|-------|
| McCC | 0.00023 | 0.00016 | 0.0000466 |
| Fuel | −0.00850 | 0.00620 | 0.0012 |
| Gas | −0.00380 | 0.00220 | 0.0012 |

## Boost (per action)

| Token | Listener | Creator | Chain |
|-------|----------|---------|-------|
| McCC | 0.00023 | 0.00016 | 0.000046 |
| Fuel | −0.00350 | 0.00120 | 0.0012 |
| Gas | −0.00380 | 0.00220 | 0.0012 |

## Track follow (per action)

| Token | Listener | Creator | Chain |
|-------|----------|---------|-------|
| McCC | −0.025 | 0.025 | 0.000466 |
| Fuel | −0.00350 | 0.00120 | 0.0012 |
| Gas | 0.00120 | −0.00280 | 0.0012 |

## Download (per action)

| Token | Listener | Creator | Chain |
|-------|----------|---------|-------|
| McCC | −0.231 | 0.231 | 0.076 |
| Fuel | −0.00350 | 0.00120 | 0.0166 |
| Gas | 0.00120 | −0.00280 | 0.0166 |

## Comment (per action)

| Token | Listener | Creator | Chain |
|-------|----------|---------|-------|
| McCC | 0.00023 | 0.00016 | 0.000466 |
| Fuel | −0.00100 | 0.00370 | 0.0012 |
| Gas | −0.00380 | 0.00220 | 0.0012 |

## Tier multipliers

Published in a future `tiers.json` when MCIP-0001 reaches **Accepted**. Until then, use site UI breakdown (Tiered / Iron / Δ) as display reference.

## Functions (Phase 2)

```python
def calculate_listen_rewards(seconds: float, tier: str = "Iron") -> RewardSplit: ...
def calculate_interaction(action: str, tier: str = "Iron") -> RewardSplit: ...
def validate_rewards(commit: dict) -> bool: ...
```
