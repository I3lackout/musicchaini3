# Growth Engine v1.0 — Product Specification

> *Companion to [Chapter 25 — Growth Engine](./25-growth-engine.md)*  
> **Status:** Draft — intended for engineering and MCIP proposals

---

## Design constraints

1. Every mechanic must increase **successful discoveries per day** or **qualified referral discovery**, not vanity signups.
2. Rewards use existing resources (**McCC**, **Fuel**, **Gas**) — no investment or return narratives.
3. Rankings and missions use **TFPS** and **UserChain** trust weighting where abuse is likely.
4. Features marked **Foundation** exist in part in the private app; **Planned** require MCIP + implementation.

---

## Phase 1 — Build the viral loop (Priority 10/10)

**Question:** What makes one user bring another?

| Mechanic | Description | Status |
|----------|-------------|--------|
| Personal referral code | Unique code per user; `?ref=` on signup | Foundation |
| Two-sided rewards | Inviter + invitee earn after **qualifying listen** (e.g. ≥3 min on platform) | Planned |
| Referral dashboard | Invites sent, converted, discoveries attributed | Planned |
| Unlock track (optional) | Gated track/exclusive mix after N qualified invites | Planned |
| Streaks | Daily discovery or listen streak; breaks reset gracefully | Planned |
| Global rankings | Explorers, mentors, regional boards | Planned |
| Artist vs Artist battles | Pair artists; community votes + streams in window | Planned |
| Limited badges | Seasonal / numbered collectibles | Planned |
| Referral rewards | McCC / Fuel / Gas per MCIP tables | Foundation (McCC bonus) + Planned (Fuel) |

**Anti-abuse:** One device cluster → one referral payout; trust score gate for leaderboard eligibility.

**Success metric:** K-factor on **qualified** referrals; referral cohort successful discovery rate ≥ platform baseline.

---

## Phase 2 — Artists recruit fans (Priority 9/10)

Artists become marketers when **their rank is public and updatable**.

### Artist profile surface

```
Artist Score

Followers     12,400
Streams       890,000
Supporters    3,200
Creator Level 28

Creator Rank:  #183 Worldwide
```

### Top 100 Rising Artists

- Refreshed **hourly** (TFPS momentum + supporter velocity + authenticity gates).
- Share copy artists can post: *"Help me reach Top 100 Rising on MusicChain."*

**Success metric:** % of new signups with `utm_artist` or artist referral code; artist-posted link CTR.

---

## Phase 3 — Growth through competition (Priority 8/10)

### Weekly Artist Cup (regional)

Example: **Germany — Week 12**

```
#1  Artist A
#2  Artist B
#3  Artist C
```

- Streams and **trust-weighted votes** count toward cup score.
- Winners receive badge + featured Discovery Party slot.

**Success metric:** Social shares per cup; discovery rate among cup listeners vs. control.

---

## Phase 4 — Community missions (Priority 8/10)

Replace generic “listen to music” with cooperative goals:

```
Mission: Germany needs 1,000,000 listening minutes this week.

Progress: ████████░░  82%

Reward on completion: +20 Fuel (all contributors above threshold)
```

- Contribution threshold prevents free-riding (minimum minutes or discoveries).
- Missions align with [Music Discovery Law](../part-i/03-music-discovery-law.md) when tied to **new artist** minutes, not only catalog replay.

---

## Phase 5 — Discover together (Priority 9/10)

### Discovery Parties

```
🎧 Electronic Discovery Room
   50 listeners · unknown artists only

Now playing: [track]
👍  ❤️  🔥  👎
```

- Hidden gems surface from **community votes**, not solo algorithm loops.
- Connects to [Live Infrastructure](../part-v/23-live-infrastructure.md) and Live-313 TFPS terminal.

**Success metric:** Successful discoveries per party hour; return rate to host profile.

---

## Phase 6 — Turn listening into a game (Priority 9/10)

Achievements expand **Fuel**, **Gas**, and badge inventory:

| Achievement | Condition | Reward |
|-------------|-----------|--------|
| **Explorer** | Listen to 50 **new** artists (first-time for user) | 100 Fuel |
| **Night Owl** | Qualifying listen after local midnight | Rare badge |
| **Supporter / Genesis** | Among First 100 listeners on a track | Genesis badge (permanent) |
| **Prophet** | Correct weekly breakout prediction | Prophet badge + Fuel |

Achievements feed **Explorer Level** on profile ([Chapter 5](../part-ii/05-the-listener.md)).

---

## Phase 7 — FOMO (Priority 7/10)

### Today’s Hidden Gem

```
Today's Hidden Gem
Available for: 23:59:44
```

- One highlighted track per day (TFPS + editorial/community pick).
- Tomorrow’s gem replaces it — encourages daily return without pay-to-win placement.

**Guardrail:** Hidden Gem selection must not be sold to artists; transparency note in UI.

---

## Phase 8 — Creator economy — early support (Priority 7/10)

Listeners allocate a **small amount of McCC** to an artist as visible support:

- **Not** financial speculation or promised returns.
- **Supporter rank** rises if the artist grows (discovery score, TFPS, followers).
- Early supporters appear on artist page (“Discovery circle”).

Maps to reputation and [Trust Economy](../part-iii/13-trust-economy.md), detailed in Part IV MCIP updates.

---

## Phase 9 — Social identity (Priority 8/10)

### MusicChain Wrapped (periodic)

```
You discovered 187 artists
before they became popular.

Top 2% Explorer
```

- One-click share (image + link with referral code).
- Metrics derived from First 100, pre-threshold discoveries, Legendary Finds.

**Success metric:** Share rate; installs from Wrapped links; discovery conversion.

---

## Phase 10 — “One more song” effect (Priority 7/10)

Never end a session on silence unless the user chooses:

- Vibe-based **next track** suggestion (Discovery DNA + TFPS).
- Small Fuel grant for accepting a **new-artist** suggestion (+5 Fuel example).

Distinct from autoplay loops: cap repeated grants per session; no reward for skipping in &lt;30s.

---

## Implementation roadmap (suggested)

| Quarter | Deliverables |
|---------|----------------|
| Q1 | Phase 1 qualified referral + dashboard; Phase 6 core achievements |
| Q2 | Phase 2 Rising 100 + Artist Score UI; Phase 9 Wrapped v1 |
| Q3 | Phase 5 Discovery Parties MVP; Phase 4 regional mission |
| Q4 | Phase 3 Artist Cup; Phase 7 Hidden Gem; Phase 8 support reputation |

Adjust per [ROADMAP.md](../../ROADMAP.md) and MCIP capacity.

---

## MCIP triggers

New economics or ranking formulas require MCIPs. Suggested titles:

- MCIP-00XX Qualified Referral Rewards
- MCIP-00XX Rising Artist Index (hourly)
- MCIP-00XX Community Mission Rewards
- MCIP-00XX Supporter McCC (reputation-only semantics)

---

*Return to [Chapter 25](./25-growth-engine.md)*
