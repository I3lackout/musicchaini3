# System layers

Seven-layer view of MusicChain i3 (logical, not deployment zones).

```
┌─────────────────────────────────────────────────────────────┐
│ Layer 7 — Frontend                                          │
│  Web (Flask templates + JS) · React Native mobile app       │
└─────────────────────────────┬───────────────────────────────┘
                              │
┌─────────────────────────────▼───────────────────────────────┐
│ Layer 6 — HTTP API                                          │
│  Routes, auth, CSRF · public docs in musicchain-api         │
└─────────────────────────────┬───────────────────────────────┘
                              │
┌─────────────────────────────▼───────────────────────────────┐
│ Layer 5 — Reward engine                                     │
│  Listen triad · tier multipliers · interaction tables       │
└─────────────────────────────┬───────────────────────────────┘
                              │
┌─────────────────────────────▼───────────────────────────────┐
│ Layer 4 — MusicChain logs                                   │
│  Chain-role treasury · passive burns · scoreboard feeds     │
└─────────────────────────────┬───────────────────────────────┘
                              │
┌─────────────────────────────▼───────────────────────────────┐
│ Layer 3 — Track blockchain                                  │
│  TrackBlock · sub-blocks · hashes · explorer UI             │
└─────────────────────────────┬───────────────────────────────┘
                              │
┌─────────────────────────────▼───────────────────────────────┐
│ Layer 2 — Database + event store                            │
│  Users, tracks, listen_triad_events, ORM models             │
└─────────────────────────────┬───────────────────────────────┘
                              │
┌─────────────────────────────▼───────────────────────────────┐
│ Layer 1 — Storage                                           │
│  Audio uploads · images · static assets · APK               │
└─────────────────────────────────────────────────────────────┘
```

## Cross-cutting concerns

| Concern | Layer(s) |
|---------|----------|
| **TFPS / soul reducer** | 5 → 3 → 2 → 7 |
| **ITC epochs** | 5, 4, 6 |
| **Live WebRTC** | 7, 6 (signaling private) |
| **Push notifications** | 6, 7 |
| **Anti-abuse** | 6 (private) |

## Public vs private boundary

| Public (OSS) | Private |
|--------------|---------|
| Rate tables, MCIPs | `.env`, keys |
| Block hash rules | Fraud heuristics |
| API path list | Admin routes |
| SDK clients | Raw SQL admin tools |
