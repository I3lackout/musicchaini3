# Roadmap

> Dates are indicative. See [CHANGELOG.md](./CHANGELOG.md) for shipped items.

## Phase 1 — Trust foundation *(now)*

- [x] Public doc tree under `opensource/`
- [x] VISION, TOKENOMICS overview, whitepaper outline
- [x] MCIP skeleton (0001–0008)
- [x] Tokenomics examples (1-minute listen walkthrough)
- [ ] Publish `musicchaini3` repo on GitHub (docs only)
- [ ] Link from musicchaini3.com footer / about page

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
- [ ] Mobile app: documented push + playtime commit API

## Phase 5 — Governance

- [ ] MCIP template + review process
- [ ] Architecture diagrams (SVG) in `docs/architecture/`
- [ ] Optional: community audit bounties for tokenomics mismatches

## Explicitly later / private

- Full Flask monolith
- Fraud scoring, device fingerprint internals
- Payment rails (Stripe), email, WAF rules
- Production deployment manifests with secrets
