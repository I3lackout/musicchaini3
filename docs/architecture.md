# Architecture

MusicChain i3 is organized as a **layered ecosystem**: clients talk to a backend API; the API drives streaming, live sessions, and an event-driven economy; outcomes are recorded on per-track chains and system logs.

## Seven layers

See the full breakdown in [architecture/layers.md](./architecture/layers.md).

| Layer | Responsibility |
|-------|----------------|
| **Clients** | Web, PWA, native mobile (Expo) |
| **API** | Auth, tracks, library, live, wallet |
| **Streaming** | Playtime commits, deduplication, rewards |
| **Economy** | McCC · Fuel · Gas · ITC, tiers, burns |
| **Chain** | TrackBlock, sub-blocks, hashes |
| **Identity** | Track soul, TFPS field, triad `event_id` |
| **Community** | Matrix, scoreboard, seed-a-node, notifications |

## Data flow (listen)

```
Mobile / Web player
    → playtime commit (API)
    → listen_triad (listener + creator + MusicChain)
    → balance updates + track blockchain tx + MusicChain log
    → notifications / analytics (derived)
```

## Public vs private

| Public (this repo) | Private (production monorepo) |
|--------------------|-------------------------------|
| Economy rules, MCIPs | Flask app, admin, WAF |
| Tokenomics reference | Fraud / abuse heuristics |
| API documentation | Secrets, payments, email |
| Architecture overview | Full deployment manifests |

We publish **rules and behavior** first so developers and artists can evaluate the system without exposing attack surface.

## Planned diagrams

SVG diagrams will be added under [architecture/](./architecture/):

- `frontend.svg` — web + mobile clients  
- `backend.svg` — public API boundary  
- `reward-engine.svg` — tier + triad pipeline  
- `blockchain.svg` — TrackBlock flow  
- `streaming.svg` — playtime commit path  

Contributions welcome — see [CONTRIBUTING.md](../CONTRIBUTING.md).

## Related docs

- [economy.md](./economy.md)  
- [streaming.md](./streaming.md)  
- [blockchain.md](./blockchain.md)  
- [ECOSYSTEM.md](../ECOSYSTEM.md)
