# Security Policy

## Supported versions

| Version | Supported |
|---------|-----------|
| Production (musicchaini3.com) | Active |
| Public docs / MCIPs | Best effort |

## Reporting a vulnerability

**Please do not** open a public GitHub issue for security bugs.

1. Email or DM project maintainers through your existing trusted channel.
2. Include steps to reproduce, impact, and any suggested fix.
3. Allow reasonable time for patch before disclosure.

We will acknowledge receipt and aim to respond within **7 days**.

## What to report

- Authentication / authorization bypass
- Remote code execution, SQL injection, SSRF
- Exposure of secrets (.env, API keys, payment tokens)
- Blockchain or reward manipulation at scale

## What is out of scope (for now)

- Missing rate limits without demonstrated abuse
- Social engineering
- Issues in **undocumented** admin endpoints (still report privately)
- Theoretical tokenomics disagreements (use MCIPs publicly)

## Safe harbor

We support good-faith research. Do not access other users’ data, degrade production, or exfiltrate databases.

## Public documentation boundaries

This repository intentionally **does not** include:

- `.env` templates with real values
- WAF / fraud / device-ban rules
- Stripe webhooks secrets, SMTP, Cloudflare tokens
- Anti-cheat heuristics that aid evasion

Publishing those would harm users more than help auditors.

## Bug bounties

No formal bounty program yet. Critical fixes may be credited in CHANGELOG with researcher permission.
