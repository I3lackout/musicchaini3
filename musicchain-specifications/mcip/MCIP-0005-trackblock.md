# MCIP-0005: TrackBlock

| Field | Value |
|-------|-------|
| MCIP | 0005 |
| Title | TrackBlock and TrackSubBlock |
| Status | Draft |
| Created | 2026-06-30 |

## Abstract

Defines block structure on a track’s blockchain.

## Specification (conceptual)

```
TrackBlock:
  id, track_id, block_type, previous_hash, payload_json, timestamp, ...
TrackSubBlock:
  parent block / community chain extensions
```

### tx_type examples

- `listen_triad`
- `like`, `boost`, `comment`, `download`, `follow`
- genesis / system blocks (restricted)

## Hash rule

```
block_hash = H(previous_hash || canonical_payload)
```

Exact hash function matches production explorer (documented when chain lib is public).

## Reference implementation

Private: `blockchain_models.py`, track blockchain routes.
