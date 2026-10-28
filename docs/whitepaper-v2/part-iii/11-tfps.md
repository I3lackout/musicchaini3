# Chapter 11 — TFPS (Track Field Pressure System)

> *Part III — The Engine*

---

## Role: the heartbeat of discovery

**Track Field Pressure (TFPS)** is MusicChain’s public-facing momentum signal. It answers:

> *Where is authentic energy building around a track before mainstream visibility catches up?*

Internal-only metrics become **FIELD STATUS** — the surface explorers use to hunt rising artists ([Chapter 5](../part-ii/05-the-listener.md), [Growth Engine](../part-vi/25-growth-engine.md)).

TFPS must pass the [Music Discovery Law](../part-i/03-music-discovery-law.md): surfacing real momentum increases discovery probability; gaming the signal triggers authenticity and trust penalties.

---

## Design principles

| Principle | Implementation |
|-----------|----------------|
| **Deterministic** | Same event vectors → same pressures (replayable audits) |
| **Versioned** | `field_pressure_version = 1` (constants frozen per version) |
| **No hidden randomness** | No `datetime.now()` inside core TFPS math |
| **Triad-aligned** | Listen triad commits feed daily buckets |
| **Bounded** | Pressures mapped through `tanh` into `(0, 1)` |

Reference: `musicchain/core/track_field_pressure.py`, tests in `scripts/test_field_pressure.py`.

---

## Inputs: daily event vectors

For each track, TFPS consumes an ordered series of **`TrackDayEvents`** (oldest → newest, typically 13 days aligned with listen triad memory):

| Counter | Weight in activity energy |
|---------|---------------------------|
| `plays` | 1.00 |
| `likes` | 1.25 |
| `boosts` | 1.50 |
| `comments` | 0.75 |
| `follows` | 1.10 |
| `downloads` | 1.20 |
| `triad_commits` | 0.40 (+ stabilizer term) |

Counts pass through `norm(x) = x / (x + k)` with `k = 100` to dampen whale spikes.

---

## Core computation (v1)

For day index `t`:

1. **Activity energy** `A(t)` — weighted sum of normalized counts (+ triad stabilizer average).
2. **Current pressure** `P_current = tanh(A(t) · 2.5)`.
3. **Resonance** — 13-day discrete kernel:  
   `P_resonance = tanh( Σ A(t−i) · weight[i] )` with decay weights `(1.00, 0.82, …, 0.08)`.
4. **Final pressure** — blend then bound:  
   `P_final = tanh( (0.68·P_current + 0.32·P_resonance) · 2.5 )`.

Constants `ALPHA_CURRENT`, `BETA_RESONANCE`, `TANH_SCALE`, and weights are fixed for version 1.

---

## Heat states (public metaphor)

`P_final` maps to human-readable **heat**:

| `P_final` range | State | Badge (example) |
|-----------------|-------|-----------------|
| &lt; 0.10 | dormant | ❄ Dormant |
| &lt; 0.35 | emerging | 🌱 Emerging |
| &lt; 0.75 | resonating | 🔥 Resonating |
| ≥ 0.75 | saturated | ☀ Saturated |

These replace opaque “popularity scores” with **thermodynamic metaphor** — consistent with McCC/Fuel/Gas coupling.

---

## Momentum and field state (today’s UI)

The reference implementation exposes:

| Field | Meaning |
|-------|---------|
| `field_state_label` | Activity-driven vs memory-dominated vs dormant |
| `momentum_display` | Ratio label when today’s activity is meaningful; avoids divide-by-zero hype |
| `pressure_current` / `pressure_resonance` / `pressure_final` | Raw bounded pressures (6 decimal places in UI) |

Shipped partial: `templates/partials/tfps_metrics.html` on track blockchain / thermo panels.

### Target FIELD STATUS card (product v2)

Whitepaper/product target — maps 1:1 from existing dict keys + derived copy:

```
FIELD STATUS
█████████░░

Pressure:        ~92%   ← round(P_final × 100)
Momentum:        High   ← momentum_display / heat band
Community Pulse: Rising ← field_state activity_driven + positive ΔP_final
Prediction:      Likely breakout within 48h  ← heuristic on ΔP_final + velocity (MCIP TBD)
```

**Prediction** lines are **heuristic copy**, not financial promises — they guide explorers; breakout outcomes feed prediction game scoring ([Chapter 5](../part-ii/05-the-listener.md)).

---

## Listen triad integration

Each play commit increments `triad_commits` for that track-day. Triad **stabilizer** quality nudges activity energy — rewarding closed, consistent triads over junk commits.

Architecture chain:

```
event_id (listen triad)
    → track block / notification
    → TFPS day bucket
    → soul reducer fragments
```

Breaking triad integrity breaks TFPS — by design.

---

## Economy coupling

TFPS modulates base rewards deterministically:

```
mccc' = mccc × (1 + 0.35 × P_final)
fuel' = fuel × (1 − 0.25 × P_final)
gas'  = gas  × (1 − 0.25 × P_final)
```

High field pressure **amplifies McCC** and **consumes** more Fuel/Gas — linking discovery momentum to participation cost without speculative tokens.

---

## Live-313 and thermo-combo ranking

Global “hottest tracks” views combine TFPS stack with live velocity:

| Component | Weight (thermo-combo v1) |
|-----------|--------------------------|
| `pressure_final` | 0.40 |
| `pressure_current` | 0.15 |
| `pressure_resonance` | 0.10 |
| Live velocity | 0.15 |
| Boom pressure / glow | 0.12 / 0.05 |
| Neural activation | 0.03 |

Reference: `musicchain/core/thermo_combo.py`, Live-313 terminal UI.

This is how **Top 100 Rising**-style surfaces can reuse one deterministic stack instead of editorial payola.

---

## TFPS → Discovery Engine outputs

| Output | Consumer |
|--------|----------|
| Rising / thermo rank | Listeners, artists sharing rank |
| Heat + momentum | Player FIELD STATUS, live overlays |
| Pressure-modulated rewards | Creator/listener economy |
| Breakout heuristics | Prediction game resolution |
| Successful discovery attribution | MCIP-0009 analytics (artist was below threshold when listener qualified) |

---

## Versioning and MCIPs

Changes to weights, kernels, or heat bands require a new **`field_pressure_version`** and an MCIP revision. v1 constants are documented in code and should be mirrored in MCIP when TFPS graduates from Draft to Accepted.

Chain validation (hash continuity) remains MCIP-0006; TFPS is **off-chain deterministic** over published event buckets.

---

## Security and abuse

- Trust-weighted votes and triad fraud checks reduce synthetic pressure.
- Sudden pressure without triad commits triggers authenticity review (private heuristics).
- Public docs describe **principles**; exploit details stay private until safe ([Chapter 21](../part-v/21-security.md)).

---

## Summary

TFPS is the **heartbeat** of MusicChain discovery — deterministic, triad-fed, bounded momentum that listeners can read, artists can share, and the discovery engine can rank on. It turns “hidden gem” from a vibe into a **measurable field**.

---

*Previous: [Chapter 10 — Discovery Engine](./10-discovery-engine.md) · Next: [Chapter 12 — UserChain](./12-userchain.md)*
