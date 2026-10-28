# MCIP-0009: Successful discovery events

| Field | Value |
|-------|-------|
| MCIP | 0009 |
| Title | Successful discovery events |
| Status | Draft |
| Created | 2026-10-24 |
| Related | [Whitepaper v2 — North Star](../../musicchaini3/docs/whitepaper-v2/part-i/02-discovery-problem.md), [Growth Engine Ph. 1](../../musicchaini3/docs/whitepaper-v2/part-vi/growth-engine-v1-spec.md) |

## Abstract

Define a **normative, deduplicated event** — `successful_discovery` — that powers MusicChain’s North Star metric (**successful discoveries per day**), qualified referral rewards, Explorer profile stats, and artist Discovery Score attribution.

## Motivation

MusicChain optimizes for **discovery**, not registered users or raw streams. Without a published event definition:

- Product, analytics, and referrals optimize for the wrong outcomes.
- “New artist listen” cannot be audited or replayed.
- Growth Engine v1.0 cannot pay inviters on **qualified discovery**.

This MCIP does **not** change McCC/Fuel/Gas base rates (MCIP-0001–0003). It defines **measurement and attribution** only.

## Definitions

| Term | Definition |
|------|------------|
| **Artist (for listener L)** | `creator_id` owning the track listened to |
| **First contact** | No prior `successful_discovery` row for `(listener_id, creator_id)` before this event |
| **Deep listen** | Single session listen time ≥ `X` seconds on any track by that artist (default **X = 180**) |
| **Qualifying follow-up** | Within **D = 14** days: save track or artist, follow artist, or return for another deep listen |

## Specification

### Event: `successful_discovery`

Emit **at most one** `successful_discovery` per `(listener_id, creator_id)` pair, when **first contact** is true and **any** of:

1. **Deep listen** threshold met, or  
2. **Qualifying follow-up** after a shorter first listen (≥ **60** s minimum to count as contact).

### Required payload (canonical)

```json
{
  "event_type": "successful_discovery",
  "event_id": "<uuid>",
  "listener_id": 123,
  "creator_id": 456,
  "track_id": 789,
  "trigger": "deep_listen | save | follow | return_listen",
  "listen_seconds": 210,
  "artist_play_count_at_event": 842,
  "triad_event_id": "<uuid-or-null>",
  "trust_score_snapshot": 0.0,
  "created_at": "2026-10-24T12:00:00Z"
}
```

| Field | Rules |
|-------|--------|
| `event_id` | Unique; idempotent insert key |
| `artist_play_count_at_event` | Total platform play count for artist at emit time (for “before 1K” stats) |
| `triad_event_id` | Link to listen triad when trigger is listen-based |
| `trust_score_snapshot` | Optional UserChain weight at emit time |

### Deduplication

- Unique constraint: `(listener_id, creator_id)` on `successful_discovery` facts.
- Replays with same idempotency key must no-op.

### Exclusions

Do not emit when:

- Listener is the track **creator** (self-listen).
- Session flagged as bot / fraud by trust pipeline (listener or triad invalid).
- Listen is &lt; **60** s unless followed by qualifying follow-up in spec above.

### Aggregates (North Star)

```
successful_discoveries_per_day(T) = count(successful_discovery where created_at in T)
```

Report globally and by cohort (referral, region, genre).

### Referral qualification (Growth Engine v1.0)

When invitee emits first `successful_discovery` within **R = 30** days of signup:

- Inviter and invitee eligible for referral reward table (McCC/Fuel — separate MCIP amendment).
- Supersedes signup-only referral bonus for new implementations.

### Profile stats (derived)

| Stat | Derivation |
|------|------------|
| Hidden Gems Found | `successful_discovery` where `artist_play_count_at_event < H` (default **H = 10_000**) |
| Artists Found Before 1K | count where `artist_play_count_at_event < 1_000` |
| Discovery Accuracy | ratio of discoveries with follow-up within D (rolling window) |
| Legendary Finds | discoveries where artist later crosses breakout threshold (TFPS + play threshold — MCIP amendment) |

## Rationale

- **Artist-granularity** matches “discovered a new artist,” not merely a new track.
- **One row per pair** prevents farming the same relationship.
- **Triad link** preserves auditable connection to TFPS and chain.
- **Play count at event** enables “early finder” stats without retroactive guesswork.

## Backwards compatibility

- Existing listens and triads remain valid; this MCIP adds a **projection**, not a breaking change to triad commits.
- Until implemented, analytics may approximate; production dashboards should label “estimated.”

## Reference implementation

| Layer | Location | Status |
|-------|----------|--------|
| Reducer / projector | `musicchain/core/discovery_events.py` | Implemented (private) |
| Store | `musicchain/models/discovery_store.py` → table `successful_discovery` | Implemented |
| Listen hook | `finalize_listen_commit_side_effects` | Implemented |
| Save / follow hooks | favourite + TrackFollow + profile follow | Implemented |
| Ensure table | `scripts/ensure_discovery_tables.py` | Implemented |
| Tests | `scripts/test_discovery_events.py` | Implemented (no DB) |
| Admin metric | Dashboard tile + daily rollup job | Planned |
| Referral payout on first discovery | Growth Engine Ph. 1 | Planned |

## Open questions (Draft)

- Exact **breakout threshold** for Legendary Finds (TFPS Δ vs play count).
- Whether **Discovery Parties** emit separate vote events that can trigger follow-up triggers.
- Public vs private export of discovery history (privacy MCIP).

## Reference

- Listen triad: `musicchain/core/listen_triad.py`
- TFPS: `musicchain/core/track_field_pressure.py`
- Trust: `musicchain/core/user_trust_ledger.py`
