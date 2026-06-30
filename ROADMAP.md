# Roadmap

> Dates are indicative. See [CHANGELOG.md](./CHANGELOG.md) for shipped items.

## 2026 milestones

| Status | Milestone |
|--------|-----------|
| ✅ | **Core platform** — accounts, tracks, library, dashboard |
| ✅ | **Streaming** — web player, playtime commits, rewards |
| ✅ | **Analytics** — listening stats, scoreboard, insights |
| ✅ | **Public docs & MCIPs** — Phase 1 open-source tree |
| ✅ | **GitHub repository** — [github.com/I3lackout/musicchaini3](https://github.com/I3lackout/musicchaini3) |
| 🟡 | **Mobile** — native app beta / early access (Android) |
| 🟡 | **Whitepaper** — outline live; expanded draft in progress |
| ⬜ | **Public API** — OpenAPI + read endpoints |
| ⬜ | **SDK** — JavaScript & Python clients |
| ⬜ | **Community nodes** — seed-a-node, network ITC pipeline docs + OSS |

Legend: ✅ shipped · 🟡 in progress · ⬜ planned

---

## Phase 1 — Trust foundation

- [x] Public doc tree (`opensource/` → GitHub)
- [x] Professional README, docs hub, banner
- [x] VISION, TOKENOMICS overview, whitepaper outline
- [x] MCIP skeleton (0001–0008)
- [x] Tokenomics examples (1-minute listen walkthrough)
- [x] Publish `musicchaini3` repo on GitHub
- [x] Link from musicchaini3.com footer / about page

## Phase 2 — Verifiable economics

- [ ] Extract `musicchain-tokenomics` package with `validation.py`
- [ ] CI: golden tests for Iron-tier listen / like / boost rates
- [ ] Publish tier multiplier tables per MCIP
- [ ] Community reward pipeline documented (Seed-a-Node, network ITC)

## Phase 3 — Chain & API transparency

- [ ] `musicchain-blockchain`: TrackBlock, TrackSubBlock, hash rules (read-only lib)
- [ ] `musicchain-api`: OpenAPI for public read endpoints
- [ ] Chain explorer alignment with MCIP-0006 validation rules

## Phase 4 — Live & clients

- [ ] `musicchain-live`: LiveSession lifecycle, signaling overview (no secrets)
- [ ] `musicchain-js-sdk` / `musicchain-python-sdk` (read + authenticated flows)
- [ ] Mobile app: Google Play open beta · App Store listing
- [ ] Documented push + playtime commit API

## Phase 5 — Governance

- [ ] MCIP template + review process
- [ ] Architecture diagrams (SVG) in `docs/architecture/`
- [ ] Optional: community audit bounties for tokenomics mismatches

## Explicitly later / private

- Full Flask monolith
- Fraud scoring, device fingerprint internals
- Payment rails (Stripe), email, WAF rules
- Production deployment manifests with secrets
