# Advanced Setup & Customization

> **Quick Start?** See the [main README](./README.md) for 2-minute setup.

This guide covers advanced configuration and troubleshooting.

## 🔧 Advanced Configuration

### Custom Trigger Patterns

Only trigger for specific file types:

```yaml
# .github/workflows/auto-docs.yml
CODE_CHANGES=$(echo "$FILES" | grep -E '^(src/api/.*\.ts|lib/.*\.js)$' || echo "")
```

### Custom Agent Behavior

Fine-tune documentation style in `.github/agents/docusaurus.md`:

```markdown
## Communication Style
- Write in first-person ("I", "we")
- Use emoji sparingly (only in headings)
- Include performance considerations
- Add "Common Pitfalls" sections
- Minimum 3 examples per API

## Code Review Standards
- Flag unclear variable names
- Suggest better abstractions
- Check for missing error handling
```

### Multiple Documentation Agents

Create specialized agents for different purposes:

```bash
.github/agents/
  ├── api-docs.md        # API reference
  ├── tutorials.md       # Tutorial content
  └── migration.md       # Migration guides
```

Reference them in issues: `@copilot @api-docs-agent`

## 🧪 Testing & Validation

See [DEMO.md](./DEMO.md) for complete testing walkthrough.

## 🔄 Keeping AutoDoc Updated

See the **[Updates](#)** section in the main README.

---

**For basic setup, see:** [README.md](./README.md)  
**For step-by-step walkthrough, see:** [DEMO.md](./DEMO.md)

### Skip documentation for specific PRs

Add `skip-docs` label to your PR before merging.

## Next Steps

- Star this repository ⭐
- Share with your team
- Customize the agent for your needs
- Contribute improvements back!
