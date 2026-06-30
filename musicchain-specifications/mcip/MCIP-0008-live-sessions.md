# MCIP-0008: Live sessions

| Field | Value |
|-------|-------|
| MCIP | 0008 |
| Title | Live sessions |
| Status | Draft |
| Created | 2026-06-30 |

## Abstract

Lifecycle for **live sessions**: create, join, watch time, resources, end.

## Specification (public lifecycle)

```
CREATE → ACTIVE → ENDED
Host: LiveSession.host_id
Viewers: watch time commits (similar dedup to track playtime)
Resources: live-specific McCC/Fuel/Gas tables (TBD in Accepted revision)
```

## Private components

WebRTC signaling, ICE servers, TURN credentials — **not** part of this MCIP.

## Reference implementation

Private: `routes/live/`, `LiveSession` model.
