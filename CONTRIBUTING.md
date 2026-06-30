# Contributing

Thank you for helping make MusicChain i3 transparent and credible.

## What we need most (Phase 1)

- Clarifying docs (economy, chain, API)
- MCIP drafts for rule changes
- Tokenomics golden examples + test vectors
- Diagrams for `docs/architecture/`
- Translations (DE/EN) for public README and FAQ

## What we are not accepting yet

- Full backend refactors in this public tree
- Changes that require production secrets
- Undocumented rate changes without an MCIP

## MCIP process

1. Copy `musicchain-specifications/mcip/MCIP-0000-template.md` *(when added)* or any existing MCIP.
2. Propose **problem**, **specification**, **rationale**, **backward compatibility**.
3. Open a PR or Discussion on the public repo.
4. Maintainers align implementation in private monorepo, then mark MCIP `Accepted`.

## Code style (when code lands in public repos)

- Python: `ruff` / `black`-compatible formatting, type hints where practical.
- JS SDK: ESM, documented public API surface only.
- Tests required for any tokenomics constant change.

## Commit messages

Use imperative mood: `docs: add MCIP-0004 ITC epoch rules`, `tokenomics: fix listen golden test`.

## Code of conduct

See [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md).

## Questions

Use GitHub Discussions when the public org is live. Until then, coordinate with project maintainers directly.
