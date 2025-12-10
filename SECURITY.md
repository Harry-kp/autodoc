# Security Policy

## Supported Versions

We release patches for security vulnerabilities in the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability in AutoDoc, please report it responsibly:

### 🔐 Private Disclosure

**Please DO NOT create a public GitHub issue for security vulnerabilities.**

Instead, please report security vulnerabilities by:

1. **Email:** Send details to [chaudharyharshit9@gmail.com](mailto:chaudharyharshit9@gmail.com)
2. **Subject:** "AutoDoc Security Vulnerability Report"
3. **Include:**
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if you have one)

### ⏱️ Response Timeline

- **Initial Response:** Within 48 hours
- **Status Update:** Within 1 week
- **Fix Timeline:** Depends on severity
  - Critical: 24-48 hours
  - High: 1 week
  - Medium: 2 weeks
  - Low: Next release

### 🏆 Recognition

Security researchers who responsibly disclose vulnerabilities will be:
- Credited in the security advisory (unless you prefer to remain anonymous)
- Listed in the project's acknowledgments
- Given a special "Security Contributor" badge

### 🛡️ Scope

**In Scope:**
- GitHub Actions workflow vulnerabilities
- Authentication/authorization issues
- Code injection possibilities
- Secrets exposure
- Malicious PR/issue creation
- Rate limiting bypasses

**Out of Scope:**
- Issues in dependencies (report to upstream)
- Social engineering attacks
- Denial of service against GitHub infrastructure
- Issues requiring physical access

### 💡 Security Best Practices for Users

When using AutoDoc:

1. **Review all PRs** before merging (never auto-merge documentation PRs)
2. **Limit workflow permissions** to only what's needed
3. **Use branch protection rules** on your main branch
4. **Enable 2FA** on your GitHub account
5. **Keep Copilot subscription active** to receive updates

### 🔍 Known Limitations

- AutoDoc PRs should always be reviewed by humans
- The tool requires write access to create PRs (use minimal permissions)
- Workflow runs consume GitHub Actions minutes

### 📚 Secure Defaults

AutoDoc is designed with security in mind:
- ✅ All PRs require manual review and merge
- ✅ No auto-deployment or auto-publishing
- ✅ Uses GitHub's built-in permissions system
- ✅ No external API calls or data collection
- ✅ Open source and auditable

### 🤝 Thank You

Thank you for helping keep AutoDoc and its users safe!

— [@Harry-kp](https://github.com/Harry-kp)
