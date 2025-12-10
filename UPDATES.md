# AutoDoc Updates & Changelog

## How to Get Updates

AutoDoc continuously improves with better prompts, bug fixes, and new features.

### Quick Update Commands

**Update Agent Prompt Only (Recommended):**
```bash
curl -o .github/agents/docusaurus.md \
  https://raw.githubusercontent.com/Harry-kp/autodoc/main/.github/agents/docusaurus.md
git add .github/agents/docusaurus.md
git commit -m "chore: update AutoDoc agent prompt"
git push
```

**Update Everything:**
```bash
curl -o .github/agents/docusaurus.md \
  https://raw.githubusercontent.com/Harry-kp/autodoc/main/.github/agents/docusaurus.md
curl -o .github/workflows/auto-docs.yml \
  https://raw.githubusercontent.com/Harry-kp/autodoc/main/.github/workflows/auto-docs.yml
git add .github/
git commit -m "chore: update AutoDoc to latest version"
git push
```

### Watch for Updates

1. Go to https://github.com/Harry-kp/autodoc
2. Click **"Watch"** → **"Custom"** → Check **"Releases"**
3. Get notified when new versions drop

## Changelog

### [Latest] - See GitHub Releases

Visit https://github.com/Harry-kp/autodoc/releases for the latest updates.

---

**Full documentation:** [README.md](./README.md)
