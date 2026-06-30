# Security

MusicChain i3 takes security seriously. This page summarizes our public policy; the full policy is in [SECURITY.md](../SECURITY.md).

## Reporting a vulnerability

**Please do not** open public GitHub issues for security vulnerabilities.

1. Email the maintainers using the contact method listed in [SECURITY.md](../SECURITY.md).  
2. Include steps to reproduce, impact assessment, and your preferred disclosure timeline.  
3. Allow reasonable time for a fix before public disclosure.

We appreciate responsible disclosure and will acknowledge reporters when permitted.

## Scope

| In scope | Out of scope (for now) |
|----------|------------------------|
| musicchaini3.com production | Social engineering |
| Public API when published | Denial-of-service at scale |
| Mobile app (beta) | Issues in third-party Expo/React Native |
| Documented economy exploits | Theoretical attacks without PoC |

## What we do not publish

The private monorepo contains controls we intentionally withhold:

- WAF / rate-limit rules  
- Fraud scoring and device fingerprint internals  
- Admin credentials and production secrets  

Publishing these would help attackers more than users.

## Secure development

As open-source modules ship (Phase 2+):

- Tokenomics changes require tests and MCIP review  
- Dependencies monitored via CI  
- SECURITY.md updated for new attack surface  

## License & branding

See [LICENSE](../LICENSE). Attribution: [NOTICE](../NOTICE). Security research on **your own accounts** in compliance with applicable law is welcome; do not access other users’ data.

---

**Full policy:** [SECURITY.md](../SECURITY.md)
