# musicchain-api (documentation only)

Public HTTP API surface for MusicChain i3. **No server code** in this repo — OpenAPI and examples only.

Base URL: `https://musicchaini3.com`

Authentication: session cookie / CSRF for browser; token flows for mobile (documented separately).

## Read — tracks & library

| Method | Path | Description |
|--------|------|-------------|
| GET | `/track/<id>` | Track page |
| GET | `/tracks/search?q=` | Track search JSON |
| GET | `/api/track/<id>/analytics` | Track analytics frame |
| GET | `/api/track/<id>/charts` | Chart primitives |

## Read — users & social

| Method | Path | Description |
|--------|------|-------------|
| GET | `/user/<username>` | Profile |
| GET | `/search?q=` | Unified search (HTML) |

## Read — chain & economy

| Method | Path | Description |
|--------|------|-------------|
| GET | `/musicchain/` | Listenings & resources |
| GET | `/musicchainiThree` | Treasury overview |
| GET | `/scoreboard` | Scoreboard |
| GET | `/top_chainers` | Leaderboard |

## Read — live & ads

| Method | Path | Description |
|--------|------|-------------|
| GET | `/live_session_view/<id>` | Live session |
| GET | `/advertising-active/<id>` | Ad campaign |

## Write — interactions (auth required)

| Method | Path | Description |
|--------|------|-------------|
| POST | `/api/playtime/commit` | Playtime / listen triad |
| POST | `/api/notifications/push-token` | Mobile push register |
| POST | `/boost`, `/like`, … | Interaction endpoints *(see private route map)* |

## Phase 3 deliverables

- [ ] `openapi.yaml` for stable read endpoints
- [ ] Postman collection
- [ ] Rate limit documentation

## SDKs

- `musicchain-js-sdk` (planned)
- `musicchain-python-sdk` (planned)

```javascript
const mc = new MusicChain({ baseUrl: 'https://musicchaini3.com' })
const tracks = await mc.searchTracks('i3')
```

## Stability

Endpoints marked **stable** in OpenAPI will not break without a version bump. HTML routes may change layout without notice.
