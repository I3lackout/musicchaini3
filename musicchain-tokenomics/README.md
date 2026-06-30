# musicchain-tokenomics

Reference documentation and (Phase 2) Python package for **verifying** MusicChain i3 reward math.

## Goals

- Anyone can recompute a **60-second listen** at Iron tier.
- CI fails if production constants drift from MCIPs without a version bump.
- No Flask dependency in the public package.

## Layout

```
musicchain-tokenomics/
├── README.md
├── RewardEngine.md      # Iron constant tables
├── examples/
│   └── listen_one_minute.md
└── (Phase 2) validation.py, tests/, pyproject.toml
```

## MCIPs

Normative: [../musicchain-specifications/](../musicchain-specifications/)

## Phase 2 API (planned)

```python
from musicchain_tokenomics import calculate_listen_rewards

rewards = calculate_listen_rewards(seconds=60, tier="Iron")
# rewards.listener.mccc, .fuel, .gas, ...
```

## Disclaimer

Experimental economy — not financial advice.
