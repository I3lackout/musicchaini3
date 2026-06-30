# MusicChain i3 Whitepaper (living document)

**Version:** 0.1 (outline)  
**Status:** Phase 1 — public draft  
**Target length:** 15–25 pages when expanded  

---

## Abstract

MusicChain i3 combines music streaming with a **multi-resource economy** (McCC, Fuel, Gas, ITC) and an auditable **track blockchain**. This document explains the vision, architecture, and economic rules at a level sufficient for developers and researchers to evaluate the system.

---

## 1. Vision

See [VISION.md](./VISION.md). MusicChain i3 prioritizes **transparent rules** and **verifiable history** over opaque engagement metrics.

## 2. Motivation

- Creators need **traceable** reward paths.
- Listeners need **fair** participation mechanics.
- The ecosystem needs **anti-fragile** accounting (logs + blocks + events).

## 3. Music economy

### 3.1 Roles

- **Listener / activist** — consumes, interacts, earns/spends resources.
- **Creator / artist** — publishes tracks, receives playtime and interaction flows.
- **MusicChain (chain)** — treasury, burns, passive allocation, epoch logic.

### 3.2 Membership tiers

Iron → Bronze → … → Pearl. Tiers apply multipliers to base (Iron) rates. Documented per MCIP.

## 4. Blockchain model

### 4.1 Track blockchain

- **TrackBlock** — block on a track’s chain (interactions, playtime commits).
- **TrackSubBlock** — finer-grained units (e.g. community sub-block chain).
- **Hashes** — `previous_hash` linkage for integrity display.

### 4.2 MusicChain logs

System-level rows mirroring chain treasury movements; used in scoreboard and passive burn displays.

## 5. Streaming

- Playtime commits with **deduplication** and session semantics.
- **Listen triad** — single event ID ties notification, TFPS, and chain write.
- Mobile app: playtime lease + push notification registration.

## 6. Live sessions

- Host / viewer model with live watch resources.
- WebRTC + signaling (private implementation; public lifecycle in MCIP-0005).

## 7. McCC

Primary credit unit. Per-second and per-interaction tables. See [docs/McCC.md](./docs/McCC.md), MCIP-0001.

## 8. Fuel

Activity fuel; often models “cost of participation” for listeners. MCIP-0002.

## 9. Gas

Network gas analog; three-way splits. MCIP-0003.

## 10. ITC

Influence credits; epochs, claims, matrix. Not equivalent to McCC. MCIP-0004.

## 11. Matrix & ranking

313 Matrix, scoreboard, top chainers — composite scores from balances + activity. Public formulas evolve via MCIP.

## 12. Validation

- Block hash continuity.
- Reward reconciliation (tier vs iron vs delta).
- Event store → reducer → projection pipeline ([state v1 schema](../../docs/state_v1_schema.md) in private monorepo).

## 13. Security

- Secrets and admin remain private.
- Public: [SECURITY.md](./SECURITY.md).
- Anti-cheat not fully disclosed until safe.

## 14. Roadmap

See [ROADMAP.md](./ROADMAP.md).

## 15. References

- [TOKENOMICS.md](./TOKENOMICS.md)
- [musicchain-specifications/](./musicchain-specifications/)
- [musicchain-tokenomics/](./musicchain-tokenomics/)
- Triad architecture (internal): `docs/triad_soul_architecture.md`

---

*This whitepaper will grow with each MCIP. Prefer MCIPs for normative rate changes; use this document for narrative and architecture.*
