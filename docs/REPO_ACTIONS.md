<details> <summary>📄 Click to Expand Markdown</summary>
# Repository GitHub Actions and Secrets Overview

This document outlines the current GitHub Actions workflows across all repositories in the homelab ecosystem, along with the required GitHub Secrets for each.

*All remotes now use SSH instead of HTTPS to improve security and avoid credential prompts.*

---

## 📁 Repository: `homelab-gitops-auditor`

**Workflows:**

- `Daily GitOps Audit` (PowerShell script)
- `Weekly GitOps Audit Email` (sends summary via Gmail SMTP)

**Secrets Required:**

- `EMAIL_USERNAME`: Your full Gmail email address
- `EMAIL_PASSWORD`: Gmail app password generated with 2FA enabled

**Notes:**

- Uses built-in `GITHUB_TOKEN` to commit audit reports.
- Gmail SMTP now in use; requires 2FA and an app-specific password.
- Avoid using regular passwords due to authentication restrictions (error: 535 or 530).
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

- *None*

**Notes:**

- Runs `yamllint` to validate configuration YAMLs.
- Consider adding schema or config validation in the future.
- Uses SSH for remote Git operations.

---

## 📁 Repository: `ESPHome`

**Workflows:**

- `Validate ESPHome YAML`

**Secrets Required:**

- *None*

**Notes:**

- Uses `esphome config` to check YAML for errors.
- Can be extended to compile firmware automatically.
- Uses SSH for remote Git operations.

---

## 📁 Repository: `Homelab`

**Workflows:**

- `Weekly Homelab Health Check`

**Secrets Required:**

- *None currently*

**Planned Extensions:**

- Central summary of audit results
- Project status dashboard
- Integration with external notifications (email, webhook)
- Uses SSH for remote Git operations.

---

## 📁 Repository: `halo`

**Workflows:**

- `Weekly Sync with Upstream`
- `Build and Release Halo EPD Firmware`

**Secrets Required:**

- `GH_TOKEN_ADMIN_HALO`: Fine-grained personal access token scoped to this fork, with `Contents: Read & Write`.

**Notes:**

- Original repository belongs to `yashmulgaonkar`.
- Forked to `festion/halo`.
- SSH remote updated:
  ```bash
  git remote set-url origin git@github.com:festion/halo.git
  git remote add upstream git@github.com:yashmulgaonkar/halo.git
  ```
- Keeps forked repository in sync with upstream weekly.
- Add `GH_TOKEN_ADMIN_HALO` secret to enable workflow push.

## 📁 Repository: `community-scripts/ProxmoxVE`

**Workflows:**

- *None configured locally*

**Secrets Required:**

- *None*

**Notes:**

- Third-party repository.
- Read-only access; push access denied.
- Local edits must be maintained in a fork for contributions.

---

## 🔐 Extended Secrets (Planned)

| Secret Name                 | Purpose                                                                   | Scope                             |
| --------------------------- | ------------------------------------------------------------------------- | --------------------------------- |
| `GH_TOKEN_ADMIN_AB_GATEWAY` | Push changes to `component-ab-gateway` fork                               | `component-ab-gateway` repo       |
| `EMAIL_USERNAME`            | Send audit summary emails                                                 | `homelab-gitops-auditor` (future) |
| `EMAIL_PASSWORD`            | Gmail app password (requires 2FA enabled) | `homelab-gitops-auditor`          |
| `GH_TOKEN_ADMIN_HALO`       | Push changes to `halo` fork                                               | `halo` repo                       |
| `PAT_TOKEN`                 | Create GitHub releases for firmware build                                 | `halo` repo                       |


</details>
