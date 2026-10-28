# Vision → Whitepaper → Code

Quick map of how the discovery OS narrative connects to docs and the running platform.  
Update this file when a vision item ships or when a chapter draft lands.

**North Star:** successful discoveries per day (see [Part I, Ch. 2](./part-i/02-discovery-problem.md))

**Law:** [Music Discovery Law](./part-i/03-music-discovery-law.md)

---

| Vision concept | Whitepaper v2 | Code / product today | Gap |
|----------------|---------------|----------------------|-----|
| Spotify vs discovery positioning | Part I, Ch. 4; Growth Ch. 25 | Marketing copy varies by page | Unify homepage: *Discover tomorrow's legends today* |
| Successful discoveries / day | Part I, Ch. 2; MCIP-0009 | `discovery_events.py` + `successful_discovery` table | Dashboard rollup still planned |
| I3 Discovery Score (Explorer Level, gems, accuracy) | Part II, Ch. 5 | Partial stats in dashboard / insights | Unified profile model + API |
| TFPS as public “heartbeat” | Part II–III, Ch. 11 | `track_field_pressure.py`, track UI, Live-313 thermo | User-facing FIELD STATUS card + breakout copy |
| Prediction game | Part II, Ch. 5; Growth spec Ph. 6 | — | Weekly pool + TFPS scoring |
| Live discovery + votes | Part II, Ch. 6–7; Part V, Ch. 23 | Live sessions, discovery routes, live UI | Structured Breakout / Needs Work tied to TFPS |
| First 100 listeners | Part II, Ch. 5 | — | Persist ordered listen triad per track |
| Discovery DNA | Part II, Ch. 5; Ch. 8 | Genre / listening analytics partial | Explorer-weighted taste vector + recs |
| Referral viral loop | Growth Engine v1.0 Ph. 1 | `referrer_code`, McCC bonus on signup | **Qualified listen** before payout |
| Rising 100 / Artist Cup | Growth spec Ph. 2–3 | Scoreboard, thermo ranking | Hourly Rising index + regional cups |
| Discovery Parties | Growth spec Ph. 5 | Live session discovery pages | Room format + vote aggregation |
| McCC / Fuel / Gas / ITC | Part IV | Reward engine, MCIPs, docs | Reframe in UI as participation resources |
| UserChain / Trust | Part III, Ch. 12–13 | `user_trust_ledger.py`, TrustLedger blocks | Surface Trust Score on profile |
| Listen triad → TFPS → chain | Part III, Ch. 10–11 | `listen_triad_events`, soul reducer | ✅ Ch. 10–11 draft; wire MCIP-0009 |
| Network effects + flywheel | Part VI, Ch. 24–25 | — | Ch. 24 prose + K-factor analytics |

---

## Document inventory (39 files)

| Status | Paths |
|--------|--------|
| **Draft prose** | `00-preface`, `part-i/*`, `part-ii/05–07`, `part-vi/25`, `growth-engine-v1-spec` |
| **Skeleton** | `part-ii/08–09`, `part-iii–v`, `part-vi/24,26–27`, `99-*` |
| **Diagrams** | `diagrams/incentive-stack.svg`, `visibility-funnel.svg`, `discovery-loop.svg` |
| **Integration** | [OUTLINE_MAP.md](./OUTLINE_MAP.md), [VISION_CODE_MAP.md](./VISION_CODE_MAP.md) |
| **Hub** | [README.md](./README.md) |

**Git:** entire `docs/whitepaper-v2/` is currently untracked alongside updated `WHITEPAPER.md`, `docs/README.md`, `ROADMAP.md`.

---

## Suggested write order (next chapters)

1. **Ch. 10 Discovery Engine** + **Ch. 11 TFPS** — ties vision to `track_field_pressure.py` and listen triad  
2. **Ch. 24 Network Effects** — expand the four loops from your original skeleton  
3. **Ch. 8 Discovery Intelligence** — Human + AI, Discovery DNA  
4. **Ch. 14 Reputation** — unify Explorer + Creator badges with Growth spec achievements  

## Suggested build order (next product)

1. **North Star event** — schema for “successful discovery” (MCIP)  
2. **Qualified referral** — reward after friend’s first discovery, not signup only  
3. **First 100** — cheap, high FOMO, on-chain or triad-backed list  
4. **TFPS FIELD STATUS card** — reuse existing `field_pressure` dict in player UI  
5. **Explorer profile v1** — 3–5 stats from map above, even if some are stubbed  

---

*Return to [Whitepaper v2 index](./README.md)*
