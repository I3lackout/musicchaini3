# Chapter 20 — Platform Architecture

> *Part V — Technology* · **Status: skeleton**

---

## Overview

MusicChain's technical architecture supports discovery at scale — from event ingestion to field pressure computation to real-time live sessions.

## Seven-layer model

```
Layer 7 — Frontend (Web + React Native mobile)
Layer 6 — HTTP API
Layer 5 — Reward engine + TFPS / soul reducer
Layer 4 — MusicChain logs
Layer 3 — Track blockchain
Layer 2 — Database + event store
Layer 1 — Storage (audio, images, assets)
```

## Planned sections

### 20.1 Layer-by-layer breakdown
### 20.2 Event store → reducer → projection pipeline
### 20.3 Listen triad architecture
### 20.4 Public vs. private boundary
### 20.5 Future: Rust kernel
### 20.6 API and SDK roadmap

See [architecture.md](../architecture.md), [layers.md](../architecture/layers.md).

---

*Previous: [Chapter 19 — Sustainability](../part-iv/19-sustainability.md) · Next: [Chapter 21 — Security](./21-security.md)*
