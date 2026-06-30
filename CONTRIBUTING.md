# Contributing

Thank you for helping make MusicChain i3 transparent and credible. This project is designed to grow into a **mature open-source ecosystem** — your contributions shape that first impression.

## Ways to contribute (Phase 1)

| Area | Examples |
|------|----------|
| **Documentation** | Clarify [docs/](./docs/), fix typos, add diagrams |
| **MCIPs** | Propose normative rule changes in [musicchain-specifications/](./musicchain-specifications/) |
| **Tokenomics** | Golden examples, test vectors in [musicchain-tokenomics/](./musicchain-tokenomics/) |
| **Architecture** | SVG diagrams for [docs/architecture/](./docs/architecture/) |
| **Translations** | DE/EN for README and FAQ |
| **Discussions** | Answer questions, gather feedback |

## What we are not accepting yet

- Full backend refactors in this public tree  
- Changes that require production secrets  
- Undocumented rate changes without an MCIP  
- Drive-by dependency upgrades without context  

---

## Feature proposals

**Economy, chain, or API behavior changes** must go through an **MCIP** (MusicChain Improvement Proposal):

1. Read existing MCIPs in [musicchain-specifications/mcip/](./musicchain-specifications/mcip/).  
2. Copy the nearest MCIP or use the template when published.  
3. Include: **problem**, **specification**, **rationale**, **backward compatibility**.  
4. Open a **Pull Request** or **GitHub Discussion**.  
5. Maintainers align implementation in the private monorepo, then mark the MCIP `Accepted`.

Smaller doc fixes do not need an MCIP — open a PR directly.

---

## Pull requests

1. **Fork** the repository and create a branch (`docs/streaming-clarity`, `mcip-0009-foo`).  
2. **Keep scope focused** — one topic per PR when possible.  
3. **Write clear commit messages** (imperative mood):  
   - `docs: add streaming hub page`  
   - `mcip: draft ITC epoch boundary rules`  
4. **Link related issues** or Discussions if applicable.  
5. Wait for review — maintainers may ask for MCIP alignment before merge.

By contributing, you agree that your contributions are licensed under the **[Apache License 2.0](./LICENSE)**.

### PR checklist

- [ ] Links resolve (relative paths work on GitHub)  
- [ ] No secrets, credentials, or production URLs with tokens  
- [ ] Economy numbers match MCIPs or are clearly marked as proposals  
- [ ] New source files include Apache 2.0 header (see [NOTICE](./NOTICE) and [LICENSE](./LICENSE) appendix)  
- [ ] No unauthorized use of MusicChain trademarks in fork branding ([TRADEMARK.md](./TRADEMARK.md))  

---

## Issues

Use **GitHub Issues** for:

- Documentation bugs (broken links, unclear sections)  
- MCIP ideas (label as `mcip-proposal`)  
- Questions that are not security-related  

Use **GitHub Discussions** for open-ended questions and community ideas.

**Do not** file public issues for **security vulnerabilities** — see [SECURITY.md](./SECURITY.md).

---

## Coding style

When code lands in public repos (Phase 2+):

| Language | Convention |
|----------|------------|
| **Python** | `ruff` / `black`-compatible, type hints where practical |
| **JavaScript / TypeScript** | ESM, documented public API only |
| **Markdown** | One H1 per file, relative links, tables for reference data |
| **Tests** | Required for any tokenomics constant change |

---

## Code of conduct

Be respectful and constructive. See [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md).

---

## Questions

- **GitHub Discussions:** [I3lackout/musicchaini3](https://github.com/I3lackout/musicchaini3/discussions)  
- **Security:** [SECURITY.md](./SECURITY.md)  
- **Live site:** [musicchaini3.com](https://musicchaini3.com)
