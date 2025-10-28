# Copilot Instructions for Digital Garden Repository

## Repository Overview

This is **Giorgio's Digital Garden** - a personal knowledge base and documentation website built with MkDocs Material. The project is a static site generator that creates HTML documentation from Markdown files, following the "digital gardening" philosophy of continuous, iterative content creation.

**Repository size**: ~4.5MB  
**Primary language**: Markdown  
**Framework**: MkDocs with Material theme  
**Target runtime**: Python 3.12  
**Deployment**: Azure Pipelines to remote web server  
**Site URL**: https://digitalgarden.maggiolo.net/

## Project Structure

### Root Directory Files
- `mkdocs.yml` - MkDocs configuration file (site settings, theme, plugins, markdown extensions)
- `azure-pipelines.yml` - CI/CD pipeline for building and deploying to production
- `README.md` - Default Azure DevOps template (minimal content, mostly TODOs)
- `.gitignore` - Excludes .cache, site/, .terraform files, and postStart_private.sh

### Key Directories
- `docs/` - All Markdown content files (~332 total lines across 9 files)
  - `index.md` - Homepage
  - `about-me.md` - Author bio
  - `digital-garden.md` - Digital gardening philosophy explanation
  - `Technologies/` - Technical documentation organized by topic
  - `assets/` - Images (logo, SVG files)
  - `stylesheets/` - Custom CSS (profile-picture.css, extras.css)
- `overrides/` - Material theme customizations
  - `partials/content.html` - Custom page status display (draft/wip/done)
  - `partials/nav-item.html` - Navigation customization
  - `partials/integrations/` - Integration components
  - `.icons/` - Custom icons
- `site/` - Generated static HTML output (created by `mkdocs build`, excluded from git)
- `.cache/` - MkDocs cache directory (excluded from git)
- `.devcontainer/` - VS Code devcontainer configuration

## Build Instructions

### Prerequisites
**Required**: Python 3.12+ with pipx installed  
**System libraries** (for imaging support): libcairo2-dev, libfreetype6-dev, libffi-dev, libjpeg-dev, libpng-dev, libz-dev

### Installation (First Time Only)
```bash
pipx install "mkdocs-material[imaging]" --include-deps
```
**Duration**: ~30-60 seconds  
**Note**: The [imaging] extra is required for the social plugin to generate social media cards.

### Build Commands

#### Standard Build
```bash
mkdocs build
```
**Duration**: ~0.5 seconds (when successful)  
**Output**: Creates `site/` directory with static HTML  
**CRITICAL ISSUE**: Build will fail with network errors if the social plugin tries to download Google Fonts and network access is restricted. Error message: `Failed to resolve 'fonts.google.com'`

#### Workaround for Network-Restricted Environments
If you encounter font download errors, temporarily disable the social plugin:
1. Edit `mkdocs.yml`
2. Comment out `- social` in the plugins section (line 79)
3. Run `mkdocs build`
4. Restore the social plugin line before committing

**Alternative**: The Azure Pipeline runs successfully because it has network access to Google Fonts.

#### Development Server
```bash
mkdocs serve
```
**Default**: Runs on localhost:8000  
**Features**: Live reload on file changes  
**Note**: Also requires network access for social plugin initialization

#### Clean Build
```bash
rm -rf site .cache
mkdocs build
```
Use this when encountering caching issues or to verify a fresh build.

### Testing
**No automated tests exist** in this repository. Testing is manual:
1. Build the site successfully
2. Verify generated HTML in `site/` directory
3. Check that all pages render correctly
4. Validate links and navigation

## Azure Pipeline (CI/CD)

The pipeline runs on: `ubuntu-latest`  
**Trigger**: Commits to `main` branch

### Pipeline Steps (in order)
1. **Install dependencies**:
   ```bash
   pipx install "mkdocs-material[imaging]" --include-deps
   ```
2. **Build site**:
   ```bash
   mkdocs build
   ```
   Creates `site/` directory with static output
3. **Create remote directory** (via SSH)
4. **Clean remote directory** (removes old content)
5. **Copy files to remote** (from `site/` to `~/digitalgarden`)
6. **Move to web server directory** (to `/var/www/html/digitalgarden/site/`)

**SSH Endpoint**: Uses 'digitalgarden-maggiolo-net' service connection (configured in Azure DevOps)

## Configuration Files

### mkdocs.yml (Main Configuration)
- **Site name**: "Giorgio's Digital Garden"
- **Theme**: Material for MkDocs with custom directory at `overrides/`
- **Features**: Navigation tabs, sections, instant loading, code copy, TOC integration
- **Plugins**: meta, social, search (blog plugin is commented out)
- **Markdown extensions**: syntax highlighting (pymdownx.highlight), tabs, admonitions, emojis, diagrams (mermaid), task lists
- **Custom CSS**: profile-picture.css, extras.css
- **Analytics**: Matomo configured
- **Color schemes**: Supports light/dark mode with system preference detection

### Custom Features
- **Page status system**: Pages can have status metadata (draft/wip/done) that displays custom admonition boxes
  - Implemented in `overrides/partials/content.html`
  - Usage: Add `status: wip` to page frontmatter
  - Statuses defined in `mkdocs.yml` under `extra.status`

### .devcontainer Configuration
- **Base image**: mcr.microsoft.com/devcontainers/base:bookworm
- **Features**: Azure CLI, OpenTofu, Python
- **Post-start script**: Runs `postStart.sh` which calls:
  - `postStart_private.sh` (excluded from git, contains secrets)
  - `postStart_public.sh` (installs mkdocs-material and system packages)
- **Network**: Uses default_network bridge

## Common Issues and Workarounds

### Issue 1: Social Plugin Font Download Failure
**Error**: `Failed to resolve 'fonts.google.com'`  
**Cause**: Network restrictions preventing access to Google Fonts  
**Solution**: Temporarily comment out `- social` in mkdocs.yml plugins section  
**Note**: This only affects local builds; Azure Pipeline has network access

### Issue 2: Missing Imaging Libraries
**Error**: Build fails when social plugin tries to generate images  
**Solution**: Install system packages:
```bash
sudo apt-get update
sudo apt-get install -y libcairo2-dev libfreetype6-dev libffi-dev libjpeg-dev libpng-dev libz-dev
```

### Issue 3: Cache Issues
**Symptom**: Changes not reflected in build output  
**Solution**: Clear cache before building:
```bash
rm -rf .cache
mkdocs build
```

## Making Code Changes

### Modifying Content
- All content is in Markdown files under `docs/`
- Changes to `.md` files do not require reinstallation
- Always validate Markdown syntax and frontmatter YAML
- Page frontmatter supports: `title`, `status`, `hide` (navigation/toc)

### Modifying Theme/Styling
- Custom CSS goes in `docs/stylesheets/`
- Must be registered in `mkdocs.yml` under `extra_css`
- Theme overrides go in `overrides/partials/`
- Follow Jinja2 template syntax for HTML overrides

### Modifying Configuration
- Always validate YAML syntax in `mkdocs.yml`
- Test build after configuration changes
- Plugin changes may require reinstallation: `pipx reinstall mkdocs-material`

## Validation Checklist

Before committing changes:
1. **Build succeeds**: Run `mkdocs build` (comment out social plugin if needed)
2. **No broken links**: Check build output for warnings
3. **Content renders**: Verify HTML output in `site/` directory
4. **Config is valid**: YAML syntax errors will break the build
5. **Git status clean**: Ensure `site/`, `.cache/`, and `postStart_private.sh` are not staged (they're gitignored)

## Important Notes

- **Trust these instructions**: Only search for additional information if these instructions are incomplete or incorrect
- **No linting configured**: There are no markdownlint, eslint, or prettier configs
- **No tests**: This is a documentation site with no test suite
- **Pipeline dependency**: The Azure Pipeline is the primary validation; local builds may fail due to network restrictions
- **Build is fast**: Successful builds take under 1 second
- **Always exclude from commits**: site/, .cache/, and postStart_private.sh files
