<details> <summary>📄 Click to Expand Markdown</summary>
# Repository GitHub Actions and Secrets Overview

This document outlines the current GitHub Actions workflows across all repositories in the homelab ecosystem, along with the required GitHub Secrets for each.

_All remotes now use SSH instead of HTTPS to improve security and avoid credential prompts._

---

## 📁 Repository: `homelab-gitops-auditor`

**Workflows:**
- `Daily GitOps Audit` (PowerShell script)

**Secrets Required:**
- _None at this time_

**Notes:**
- Uses built-in `GITHUB_TOKEN` to commit audit reports.
- Will be extended to generate weekly summary reports and email notifications.
- Uses SSH for remote Git operations.

---

## 📁 Repository: `component-ab-gateway`

**Workflows:**
- `Weekly Sync with Upstream`

**Secrets Required:**
- `GH_TOKEN_ADMIN_AB_GATEWAY`: Fine-grained personal access token scoped to this fork, with `Contents: Read & Write`.

**Notes:**
- Keeps forked repository in sync with `AprilBrother/component-ab-gateway` weekly.
- Optionally extend to notify or summarize updates.
- Uses SSH for remote Git operations.

---

## 📁 Repository: `home-assistant-config`

**Workflows:**
- `YAML Lint` (runs on push/PR)

**Secrets Required:**
- _None_

**Notes:**
- Runs `yamllint` to validate configuration YAMLs.
- Consider adding schema or config validation in the future.
- Uses SSH for remote Git operations.

---

## 📁 Repository: `ESPHome`

**Workflows:**
- `Validate ESPHome YAML`

**Secrets Required:**
- _None_

**Notes:**
- Uses `esphome config` to check YAML for errors.
- Can be extended to compile firmware automatically.
- Uses SSH for remote Git operations.

---

## 📁 Repository: `Homelab`

**Workflows:**
- `Weekly Homelab Health Check`

**Secrets Required:**
- _None currently_

**Planned Extensions:**
- Central summary of audit results
- Project status dashboard
- Integration with external notifications (email, webhook)
- Uses SSH for remote Git operations.

---

## 🔐 Extended Secrets (Planned)

| Secret Name                | Purpose                                          | Scope                      |
|----------------------------|--------------------------------------------------|-----------------------------|
| `GH_TOKEN_ADMIN_AB_GATEWAY` | Push changes to `component-ab-gateway` fork     | `component-ab-gateway` repo|
| `EMAIL_USERNAME`          | Send audit summary emails                       | `homelab-gitops-auditor` (future)
| `EMAIL_PASSWORD`          | SMTP auth token or app-specific password        | `homelab-gitops-auditor` (future)

---

_Last updated: 2025-03-26_


</details>
