# Examples

This directory contains example scenarios showing how AutoDoc works.

## Example 1: New API Function

### Code Change (Merged PR)

**File:** `src/api/users.ts`
```typescript
/**
 * Creates a new user in the system
 */
export async function createUser(
  name: string, 
  email: string,
  options?: CreateUserOptions
): Promise<User> {
  // Implementation
  return await db.users.create({ name, email, ...options });
}
```

### AutoDoc Response

**Issue Created:**
```
📚 Update documentation for PR #123

@docusaurus-agent Please review the code changes and update documentation.

Files Changed:
- src/api/users.ts (new function added)
```

**Documentation PR Created by Copilot:**

**File:** `docs/api/users.md` (new file)
```markdown
---
title: User API
sidebar_position: 2
---

# User API

Functions for managing users in the system.

## createUser

Creates a new user in the system.

### Signature

\`\`\`typescript
async function createUser(
  name: string, 
  email: string,
  options?: CreateUserOptions
): Promise<User>
\`\`\`

### Parameters

- **name** (`string`): The user's full name
- **email** (`string`): The user's email address  
- **options** (`CreateUserOptions`, optional): Additional options
  - `role`: User role (default: 'user')
  - `verified`: Email verification status (default: false)

### Returns

Returns a `Promise` that resolves to the created `User` object.

### Example

\`\`\`typescript
import { createUser } from '@/api/users';

// Basic usage
const user = await createUser(
  'John Doe',
  'john@example.com'
);

// With options
const adminUser = await createUser(
  'Admin User',
  'admin@example.com',
  { role: 'admin', verified: true }
);
\`\`\`

### Error Handling

\`\`\`typescript
try {
  const user = await createUser('Jane Doe', 'jane@example.com');
} catch (error) {
  if (error.code === 'EMAIL_EXISTS') {
    console.error('Email already registered');
  }
}
\`\`\`
```

**File:** `sidebars.js` (updated)
```javascript
module.exports = {
  docs: [
    'intro',
    {
      type: 'category',
      label: 'API',
      items: [
        'api/overview',
        'api/users', // ← Added automatically
      ],
    },
  ],
};
```

---

## Example 2: Breaking Change

### Code Change (Merged PR)

**File:** `src/auth/login.ts`
```typescript
// Old (v1.x):
// export function login(username: string, password: string)

// New (v2.0):
export function login(credentials: LoginCredentials): Promise<AuthToken> {
  const { username, password, mfaCode } = credentials;
  // Implementation with MFA support
}
```

### AutoDoc Response

**Documentation PR Created by Copilot:**

**File:** `docs/migration/v2.md` (new file)
```markdown
---
title: Migration to v2.0
sidebar_position: 1
---

# Migration Guide: v2.0

## Breaking Changes

### Authentication API

The `login` function signature has changed to support multi-factor authentication.

#### Before (v1.x)

\`\`\`typescript
import { login } from '@/auth';

await login('username', 'password');
\`\`\`

#### After (v2.0)

\`\`\`typescript
import { login } from '@/auth';

await login({
  username: 'username',
  password: 'password',
  mfaCode: '123456' // Optional
});
\`\`\`

#### Why This Change?

This change enables:
- Multi-factor authentication support
- Future authentication methods (OAuth, SSO)
- Better parameter validation
- Consistent API design

#### Migration Steps

1. Update all `login()` calls to use object syntax
2. Add MFA support if needed
3. Test authentication flow

\`\`\`typescript
// Before
- await login(user, pass);

// After
+ await login({ username: user, password: pass });
\`\`\`
```

**File:** `docs/auth/login.md` (updated)
```markdown
---
title: Authentication
---

# Authentication

## login

:::warning Breaking Change in v2.0
The login function signature has changed. See the [Migration Guide](/migration/v2) for details.
:::

Authenticates a user and returns an auth token.

### Signature

\`\`\`typescript
function login(credentials: LoginCredentials): Promise<AuthToken>
\`\`\`

### Parameters

- **credentials** (`LoginCredentials`):
  - `username` (string): User's username
  - `password` (string): User's password
  - `mfaCode` (string, optional): MFA verification code

### Example

\`\`\`typescript
// Basic login
const token = await login({
  username: 'user@example.com',
  password: 'secure123'
});

// With MFA
const token = await login({
  username: 'user@example.com',
  password: 'secure123',
  mfaCode: '123456'
});
\`\`\`
```

---

## Example 3: New Feature

### Code Change (Merged PR)

**Files:**
- `src/features/export/pdf.ts` (new)
- `src/features/export/csv.ts` (new)
- `src/features/export/index.ts` (new)

```typescript
export function exportToPDF(data: any[], options?: ExportOptions) { }
export function exportToCSV(data: any[], options?: ExportOptions) { }
```

### AutoDoc Response

**Documentation PR Created by Copilot:**

**File:** `docs/features/export.md` (new file)
```markdown
---
title: Data Export
sidebar_position: 4
tags: [feature, export, pdf, csv]
---

# Data Export

Export your data to various formats.

## Supported Formats

- **PDF** - Formatted documents
- **CSV** - Spreadsheet data

## Quick Start

\`\`\`typescript
import { exportToPDF, exportToCSV } from '@/features/export';

// Export to PDF
await exportToPDF(users, {
  filename: 'users.pdf',
  orientation: 'portrait'
});

// Export to CSV
await exportToCSV(users, {
  filename: 'users.csv',
  headers: ['Name', 'Email', 'Role']
});
\`\`\`

## API Reference

### exportToPDF

Exports data to a PDF document.

**Signature:**
\`\`\`typescript
function exportToPDF(data: any[], options?: PDFExportOptions): Promise<void>
\`\`\`

**Options:**
- `filename` (string): Output filename
- `orientation` ('portrait' | 'landscape'): Page orientation
- `pageSize` ('A4' | 'Letter'): Paper size

**Example:**
\`\`\`typescript
await exportToPDF(invoices, {
  filename: 'invoices-2024.pdf',
  orientation: 'landscape',
  pageSize: 'A4'
});
\`\`\`

### exportToCSV

Exports data to a CSV file.

**Signature:**
\`\`\`typescript
function exportToCSV(data: any[], options?: CSVExportOptions): Promise<void>
\`\`\`

**Options:**
- `filename` (string): Output filename
- `headers` (string[]): Column headers
- `delimiter` (string): Field delimiter (default: ',')

**Example:**
\`\`\`typescript
await exportToCSV(products, {
  filename: 'products.csv',
  headers: ['ID', 'Name', 'Price', 'Stock'],
  delimiter: ','
});
\`\`\`

## Common Use Cases

### Export Search Results

\`\`\`typescript
const results = await searchUsers({ role: 'admin' });
await exportToCSV(results, {
  filename: 'admin-users.csv'
});
\`\`\`

### Batch Export

\`\`\`typescript
const reports = await getMonthlyReports();
for (const report of reports) {
  await exportToPDF(report.data, {
    filename: `report-${report.month}.pdf`
  });
}
\`\`\`
```

**File:** `sidebars.js` (updated)
```javascript
module.exports = {
  docs: [
    'intro',
    {
      type: 'category',
      label: 'Features',
      items: [
        'features/authentication',
        'features/export', // ← Added
      ],
    },
  ],
};
```

---

## Example 4: Bug Fix with Doc Update

### Code Change (Merged PR)

**File:** `src/utils/validation.ts`
```typescript
// Fixed: email validation was too strict
// Old regex didn't accept + in email addresses
// New regex: /^[^\s@]+@[^\s@]+\.[^\s@]+$/
export function validateEmail(email: string): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}
```

### AutoDoc Response

**Documentation PR Created by Copilot:**

**File:** `docs/utils/validation.md` (updated)
```markdown
## validateEmail

:::tip Fixed in v1.2.3
Email validation now correctly accepts `+` symbols in email addresses (e.g., `user+tag@example.com`).
:::

Validates an email address format.

### Example

\`\`\`typescript
validateEmail('user@example.com');      // ✅ true
validateEmail('user+tag@example.com');  // ✅ true (now supported!)
validateEmail('invalid.email');         // ❌ false
\`\`\`
```

---

These examples show the typical documentation updates AutoDoc creates. The quality and detail level can be customized by editing the agent configuration in `.github/agents/docusaurus.md`.
