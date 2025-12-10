# AutoDoc Demo: Step-by-Step Walkthrough

> **Quick setup?** See the [main README](./README.md) - it takes 2 minutes.

This demo shows exactly what happens at each step when you set up and use AutoDoc.

## 🎬 Complete Walkthrough

### Step 1: Create Template Repository (30 seconds)

1. Visit **https://github.com/Harry-kp/autodoc**
2. Click green **"Use this template"** button
3. Name it anything (e.g., `my-autodoc`)
4. Click **"Create repository"**

**Result:** You now have your own copy of AutoDoc

### Step 2: Run Setup Workflow (60 seconds)

1. In YOUR new repo → **Actions** tab
2. Click **"Setup AutoDoc in Target Repository"**
3. Click **"Run workflow"** (right side)
4. Enter target repo: `your-username/your-project`
5. Click **"Run workflow"**

**What happens:**
- ✅ Downloads AutoDoc files
- ✅ Creates PR in your target repo
- ✅ Shows success message

### Step 3: Merge Setup PR (30 seconds)

1. Go to **your-project** repository
2. **Pull Requests** tab
3. See: **"🤖 Set up AutoDoc"**
4. Click **"Merge pull request"**

**Files added:**
```
.github/agents/docusaurus.md    ← AI configuration
.github/workflows/auto-docs.yml ← Automation
```

### Step 4: Test It! (2 minutes)

**Make a code change:**

```typescript
// src/utils/math.ts
export function add(a: number, b: number): number {
  return a + b;
}
```

**Create PR and merge:**
```bash
git checkout -b add-math-utils
git add src/utils/math.ts
git commit -m "feat: add math utilities"
git push origin add-math-utils
# Create PR on GitHub and merge it
```

**Watch the magic:**
1. GitHub Action runs automatically (Actions tab)
2. Issue created: "Update docs for PR #X" (Issues tab)
3. Copilot responds with documentation PR
4. Review and merge the docs PR

**Result:** Your docs are updated!

## 📝 Example Output

After merging your code PR, Copilot creates:

**`docs/api/math.md`:**
```markdown
---
sidebar_position: 3
---

# Math Utilities

## add

Adds two numbers together.

### Signature
\`\`\`typescript
function add(a: number, b: number): number
\`\`\`

### Parameters
- `a` (number): First number
- `b` (number): Second number

### Returns
- (number): Sum of a and b

### Example
\`\`\`typescript
import { add } from '@/utils/math';

const result = add(5, 3);
console.log(result); // 8
\`\`\`
```

## 🎥 Video Demo

> **Coming soon:** Full video walkthrough

## 🔄 What's Next?

- **Customize:** Edit `.github/agents/docusaurus.md` to change documentation style
- **Advanced:** See [SETUP.md](./SETUP.md) for advanced configuration
- **Updates:** See README for how to get AutoDoc updates

---

**Questions?** Check the [main README](./README.md) or [open an issue](https://github.com/Harry-kp/autodoc/issues/new)

3. **Commit and push**
   ```bash
   git add src/api/hello.ts
   git commit -m "feat: Add sayHello function"
   git push origin test-autodoc
   ```

4. **Create PR**
   - Go to your repository on GitHub
   - Click "Compare & pull request"
   - Title: "Test AutoDoc - Add hello function"
   - Create pull request

5. **Merge the PR**
   - Click "Merge pull request"
   - Confirm merge

### Expected Results (within 1-2 minutes)

1. **GitHub Action runs**
   - Actions tab shows: "Auto-Update Documentation" ✅

2. **Issue created**
   - Issues tab shows: "📚 Update documentation for PR #X"
   - Assigned to: @copilot
   - Mentions: @docusaurus-agent

3. **Copilot works** (may take a few minutes)
   - Copilot reads the code changes
   - Analyzes what documentation is needed
   - Creates documentation PR

4. **Documentation PR appears**
   - Pull Requests tab shows new PR from Copilot
   - Title: "docs: Add documentation for sayHello function"
   - Files changed: 
     - `docs/api/hello.md` (new)
     - `sidebars.js` (updated)

5. **Review documentation**
   ```markdown
   ---
   title: Hello API
   ---
   
   # Hello API
   
   ## sayHello
   
   Returns a greeting message.
   
   ### Signature
   \`\`\`typescript
   function sayHello(name: string): string
   \`\`\`
   
   ### Example
   \`\`\`typescript
   import { sayHello } from '@/api/hello';
   
   const greeting = sayHello('World');
   console.log(greeting); // "Hello, World!"
   \`\`\`
   ```

6. **Merge documentation PR**
   - Review the documentation
   - Request changes if needed (Copilot will update)
   - Merge when satisfied

## 🎯 Real-World Usage Examples

### Example 1: API Function Documentation

**Your code:**
```typescript
// src/api/users.ts
export async function createUser(
  email: string,
  name: string,
  options?: CreateUserOptions
): Promise<User> {
  // Implementation
}
```

**AutoDoc creates:**
- `docs/api/users.md` with full API documentation
- Examples showing basic and advanced usage
- Parameter descriptions
- Return value documentation
- Error handling examples

### Example 2: Breaking Change Documentation

**Your code:**
```typescript
// Changed from:
// login(username, password)
// To:
login({ username, password, mfaCode })
```

**AutoDoc creates:**
- Updates `docs/auth/login.md`
- Creates `docs/migration/v2.md` migration guide
- Shows before/after examples
- Explains why the change was made

### Example 3: New Feature Documentation

**Your code:**
```typescript
// src/features/export/
export function exportToPDF(data: any[]) { }
export function exportToCSV(data: any[]) { }
```

**AutoDoc creates:**
- `docs/features/export.md` feature guide
- Multiple usage examples
- Common use cases
- Troubleshooting section

## 🎨 Customization Examples

### Customize Documentation Style

Edit `.github/agents/docusaurus.md`:

```markdown
## Communication Style

Write in a friendly, approachable tone.
Use emoji in headings for visual interest 🎯
Include at least 2 code examples per function.
Add "Common Mistakes" section for tricky APIs.
Use "you" instead of "the user".
```

### Only Document Public APIs

```markdown
## Scope

Focus ONLY on:
- Exported functions from src/api/
- Public classes
- User-facing features

NEVER document:
- Internal helper functions
- Private methods
- Test utilities
```

### Require Examples

```markdown
## Documentation Quality

Every API function MUST include:
- At least 2 code examples (basic + advanced)
- Error handling example
- Common use cases section
- Links to related documentation
```

### Custom Triggers

Edit `.github/workflows/auto-docs.yml`:

```yaml
# Only trigger for TypeScript files in src/api
CODE_CHANGES=$(echo "$FILES" | grep -E '^src/api/.*\.ts$' || echo "")
```

## 📊 Monitoring & Analytics

### View Documentation Activity

```bash
# List recent documentation issues
gh issue list --label documentation,automated --limit 10

# List documentation PRs
gh pr list --label documentation --state all --limit 10
```

### Check Success Rate

Track in your team's dashboard:
- Documentation PRs created
- Documentation PRs merged
- Average time to merge
- Documentation coverage

### GitHub Insights

- Actions tab → "Auto-Update Documentation" workflow
- See success/failure rate
- Check execution times
- View logs for debugging

## 🐛 Troubleshooting Guide

### Issue: Workflow Not Triggering

**Symptom:** No issue created after merging PR

**Solutions:**
1. Check Actions tab for errors
2. Verify workflow file: `.github/workflows/auto-docs.yml`
3. Check PR had source code changes (not just docs)
4. Verify PR doesn't have `skip-docs` label
5. Check Actions permissions: Settings → Actions → General

### Issue: Copilot Not Responding

**Symptom:** Issue created but no documentation PR

**Solutions:**
1. Verify Copilot enabled: Settings → Copilot
2. Check agent file exists: `.github/agents/docusaurus.md`
3. Verify you have active Copilot subscription
4. Wait a bit longer (can take 5-10 minutes)
5. Try manual trigger: Comment "@copilot please update docs"

### Issue: Poor Documentation Quality

**Symptom:** Generated docs are too generic

**Solutions:**
1. Edit `.github/agents/docusaurus.md` with more specific instructions
2. Add better context in PR descriptions
3. Provide feedback in documentation PRs (Copilot learns!)
4. Include examples of good documentation
5. Set explicit quality requirements in agent config

### Issue: Wrong Files Modified

**Symptom:** Agent modified source code

**Solutions:**
1. Review agent's "Files You NEVER Modify" section
2. Make it more explicit:
   ```markdown
   ❌ You CANNOT modify ANY files in:
   - src/
   - lib/
   - components/
   ```
3. Report the issue so we can improve the default config

## 💡 Tips & Best Practices

### 1. Write Good PR Descriptions

Better PR descriptions = Better documentation:

```markdown
**Good PR description:**
"Added createUser() function to the API. It accepts name, email, and 
optional role. Returns a User object. Throws EmailExistsError if email 
is already registered."

**AutoDoc can extract:**
- Function purpose
- Parameters and types
- Return value
- Error cases
```

### 2. Use Conventional Commits

```bash
feat: Add user creation API
fix: Correct email validation regex
docs: Update API examples
breaking: Change login signature
```

Helps AutoDoc categorize changes correctly.

### 3. Review Documentation PRs

- Treat them like code reviews
- Request changes if needed
- Copilot will update based on feedback
- This improves future documentation

### 4. Skip When Not Needed

Add `skip-docs` label to PRs that don't need documentation:
- Dependency updates
- Internal refactoring
- Test changes
- CI/CD updates

### 5. Provide Feedback

When Copilot creates good docs:
- Approve and merge quickly
- Leave positive comments

When docs need improvement:
- Request specific changes
- Show examples of what you want
- Copilot learns from feedback

## 🎓 Advanced Usage

### Multi-Repository Documentation

Set up AutoDoc in multiple repos:
- Use same template for all repos
- Customize each agent config
- Maintain consistency across projects

### Custom Documentation Types

Extend the agent for:
- API reference generation
- Architecture documentation
- Deployment guides
- Troubleshooting docs

### Integration with Deployment

Add to your workflow:
```yaml
- name: Deploy docs after merge
  if: github.event.pull_request.merged == true
  run: npm run docs:deploy
```

## 🚀 Next Steps

Now that AutoDoc is set up:

1. **Use it regularly** - Merge PRs and watch it work
2. **Customize** - Tune the agent for your needs
3. **Share** - Tell your team about it
4. **Contribute** - Improve the template for others
5. **Star the repo** ⭐ if it saves you time!

## 📚 Additional Resources

- [GitHub Copilot Documentation](https://docs.github.com/copilot)
- [Docusaurus Documentation](https://docusaurus.io)
- [GitHub Actions Documentation](https://docs.github.com/actions)
- [AutoDoc Examples](./examples/README.md)

## 🤝 Get Help

- **Issues**: Create an issue in this repository
- **Discussions**: Ask questions in GitHub Discussions
- **Community**: Join our Discord (coming soon)

---

**Congratulations!** 🎉 You now have automated documentation that stays in sync with your code!
