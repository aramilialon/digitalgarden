# GitHub Actions Workflows

## Deploy Workflow

The `deploy.yml` workflow automatically builds and deploys the Digital Garden site to the remote web server when changes are pushed to the `main` branch.

### Required GitHub Secrets

To use this workflow, you need to configure the following secrets in your GitHub repository settings (Settings → Secrets and variables → Actions):

- **`SSH_HOST`**: The hostname or IP address of your remote server (e.g., `digitalgarden.maggiolo.net`)
- **`SSH_USERNAME`**: The SSH username for connecting to the remote server
- **`SSH_PRIVATE_KEY`**: The private SSH key for authentication (should match the public key on the server)
- **`SSH_PORT`**: The SSH port number (typically `22`)

### Workflow Steps

1. **Checkout repository**: Clones the repository code
2. **Set up Python**: Installs Python 3.12
3. **Install pipx**: Installs pipx package manager
4. **Install mkdocs-material[imaging]**: Installs MkDocs Material theme with imaging support
5. **Build site**: Builds the static site using `mkdocs build`
6. **Create remote directory**: Creates the target directory on the remote server
7. **Remove old files**: Cleans the remote directory
8. **Copy files**: Copies the built site to the remote server
9. **Move to web server**: Moves files to the final web server directory

### Migration from Azure DevOps

This workflow is the GitHub Actions equivalent of the `azure-pipelines.yml` file and performs the same operations:
- Uses the same build process (`mkdocs-material[imaging]`)
- Deploys to the same remote server location
- Follows the same deployment steps

The main differences are:
- Uses GitHub Actions syntax instead of Azure Pipelines
- Uses GitHub Secrets instead of Azure service connections
- Uses community actions for SSH/SCP instead of Azure tasks
