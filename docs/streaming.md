# Streaming

MusicChain i3 delivers music through the **web app**, **PWA**, and **native mobile** clients. Streaming is the primary entry point into the reward economy.

## Clients

| Client | Status | Notes |
|--------|--------|-------|
| **Web** | Live | Full feature set at [musicchaini3.com](https://musicchaini3.com) |
| **PWA** | Live | Add to Home Screen — especially on iPhone via `/app` |
| **Android mobile** | Beta | Native app — [musicchaini3.com/app](https://musicchaini3.com/app) |
| **iOS mobile** | Beta / internal | Expo internal builds; App Store later |

Package: `com.musicchaini3.mobile` · Deep link: `musicchaini3mobile://`

## Core flows

### Playback

1. User selects a track (search, library, feed, live session).  
2. Player streams audio from the platform CDN / backend.  
3. Playtime is tracked with deduplication rules (minimum listen thresholds).  
4. On commit, a **listen triad** runs — see [economy.md](./economy.md).

### Library & playlists

- Personal library, likes, reposts, and curated lists.  
- Listening history feeds analytics and creator dashboards.

### Lock-screen & background (mobile)

Native Android/iOS builds use background audio and media controls where the OS allows. See production notes in the private monorepo.

## Playtime → rewards

Streaming is not passive entertainment only — documented playtime can generate **McCC**, **Fuel**, and **Gas** movements per tier tables. Rates are public in MCIPs and [musicchain-tokenomics/](./musicchain-tokenomics/).

## Live sessions

Live streaming extends playback with:

- Host / viewer roles  
- Watch-time rewards  
- WebRTC signaling (implementation private; rules documented in MCIP-0008)

## Mobile install

- **Android:** Google Play beta (early access) or APK sideload via `/app`  
- **iPhone:** PWA “Add to Home Screen” or Expo internal native build  

## API (future)

Authenticated streaming and playtime commit endpoints will be documented in [musicchain-api/](../musicchain-api/) as Phase 3 opens.

## Related

- [economy.md](./economy.md)  
- [blockchain.md](./blockchain.md)  
- [architecture.md](./architecture.md)
