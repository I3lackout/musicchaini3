# MusicChain i3 — Open Source Ecosystem

This folder is the **public trust layer** of MusicChain i3. It is designed to be split into separate GitHub repositories over time, without publishing the full private Flask deployment.

## Philosophy

MusicChain i3 is a **music streaming platform with a transparent resource economy** — not a classic “coin first” project. Trust comes from **verifiable rules**, documented standards, and reference implementations — not from marketing claims.

```
MusicChain i3
├── 🌍 Public (this tree)     — docs, specs, tokenomics reference, SDK stubs
├── 🔒 Private (main app)     — Flask backend, admin, fraud, payments, secrets
└── 📚 Living docs            — synced from production behavior over time
```

## Repository map (target)

| Repository | Status | Purpose |
|------------|--------|---------|
| [musicchaini3](./musicchaini3/) | **Phase 1 — active** | Project face: README, vision, roadmap, whitepaper outline |
| [musicchain-specifications](./musicchain-specifications/) | **Phase 1 — started** | MCIPs — MusicChain Improvement Proposals |
| [musicchain-tokenomics](./musicchain-tokenomics/) | **Phase 1 — started** | Reward formulas, examples, future `validation.py` |
| [musicchain-api](./musicchain-api/) | Stub | Public API documentation only |
| musicchain-docs | Later | Expanded tutorials (may merge into musicchaini3/docs) |
| musicchain-js-sdk | Later | JavaScript client |
| musicchain-python-sdk | Later | Python client |
| musicchain-blockchain | Later | TrackBlock, validators (extracted modules) |
| musicchain-live | Later | LiveSession, WebRTC docs |

## What we publish first (Phase 1)

1. **Why** — vision, FAQ, roadmap  
2. **What** — tokenomics overview, economy docs  
3. **How (rules)** — MCIPs for McCC, Fuel, Gas, ITC, blocks, validation  
4. **Not yet** — full backend, admin, anti-abuse internals, secrets  

## What stays private

- `.env`, database credentials, API keys (Stripe, SMTP, Cloudflare, Expo tokens)
- Admin panels, moderation tooling, fraud/abuse heuristics that aid attackers
- Undocumented security controls

See [musicchaini3/SECURITY.md](./musicchaini3/SECURITY.md).

## Publishing workflow

1. Work in `opensource/<repo>/` inside the monorepo.  
2. When ready, `git subtree split` or copy to a new public GitHub repo.  
3. Link public repos from [musicchaini3.com](https://musicchaini3.com).  
4. MCIPs and CHANGELOG updated when economy rules change in production.

## Internal cross-links

Production architecture notes (private monorepo) that inform these docs:

- `docs/triad_soul_architecture.md`
- `docs/state_v1_schema.md`
- `docs/track_identity_architecture.md`
- `docs/analytics_engine.md`

---

**Start here:** [musicchaini3/README.md](./musicchaini3/README.md)
