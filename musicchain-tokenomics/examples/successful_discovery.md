# Example — Successful discovery (MCIP-0009)

A listener who has never discovered artist **A** commits a listen triad of **210 seconds**.

That meets the deep-listen threshold (**X = 180**). One `successful_discovery` row is written:

```json
{
  "event_type": "successful_discovery",
  "listener_id": 11,
  "creator_id": 22,
  "track_id": 33,
  "trigger": "deep_listen",
  "listen_seconds": 210,
  "artist_play_count_at_event": 842
}
```

A later listen to the same artist does **not** emit another row — unique `(listener_id, creator_id)`.

If the first listen is only **90 seconds** (contact, not deep), a **save** or **follow** within 14 days emits `trigger: "save"` or `"follow"` instead.

See [MCIP-0009](../../musicchain-specifications/mcip/MCIP-0009-successful-discovery.md).
